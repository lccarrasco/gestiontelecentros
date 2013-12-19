<?php include_once('header.html') ?>

 <div id='map_canvas' style='position:fixed; height:600px; width:600px;'></div>
 <script type='text/javascript'>
        //<![CDATA[
        var map;
        var elementos = new Array();
        var numElems = 0;
        var drawingManager;
        var ultimoAdicionado = null;

		var listaKMLsActivos = {};
		
		function AddKML(pURL) {
                pURL = pURL.toString();
                pURL = pURL.substring(0, pURL.length - 1);
                if (listaKMLsActivos[pURL] == null) {
                    listaKMLsActivos[pURL] = new google.maps.KmlLayer(pURL, {
                        map: map,
                        preserveViewport: false
                    });
					return "ON"
                } else {
                    listaKMLsActivos[pURL].setMap(null);
                    listaKMLsActivos[pURL] = null;
					return "OFF";
                }

           }
		 function pprint(s){
		  alert(JSON.stringify(s, undefined, 2));
		 }
		function adicionarTelecentros(){
			$.getJSON('scripts/gettelecentros.php',function(data){
				pprint(data['datos']);
				data =  data['datos'];
				pprint(data);
				for (key in data) {
						pprint(key);
					if (data.hasOwnProperty(key) ){
					
						nuevaLatLng =new google.maps.LatLng(
							data[key][0].latitud,
							data[key][0].longitud
							);
						var marker = new google.maps.Marker({map:map,position:nuevaLatLng});
  
					}
				}
			});
		}
		
		
        function initialize() {
            ultimoAdicionado = null;
            var myLatlng = new google.maps.LatLng(-17.754378, - 63.189272); /*Centro de Santa Cruz*/
            var myOptions = {
                zoom: 13,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
            drawingManager = new google.maps.drawing.DrawingManager({
                drawingControl: true,
                drawingControlOptions: {
                    position: google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [google.maps.drawing.OverlayType.CIRCLE, google.maps.drawing.OverlayType.POLYLINE, google.maps.drawing.OverlayType.POLYGON]
                },
                circleOptions: {
                    editable: false
                },
                polylineOptions: {
                    editable: false
                },
                polygonOptions: {
                    editable: false
                }
            });
            drawingManager.setMap(map);
            setTimeout(adicionarTelecentros,300);
            google.maps.event.addListener(drawingManager, 'overlaycomplete', function (event) {
                ultimoAdicionado = null;
                var newShape = event.overlay;
                newShape.type = event.type;
                drawingManager.setDrawingMode(null);
				
                if (newShape.type == 'circle') {
                    newShape.tipo = 'C';
                    newShape.radio = newShape.getRadius().toFixed(0);
                    newShape.centro = newShape.getCenter();
                    newShape.id = coordenadasAHash(newShape.centro);
                }
                if (newShape.type == 'polygon') {
                    newShape.tipo = 'P';
                    newShape.ruta = '';
                    newShape.id = coordenadasAHash(newShape.getPath().getAt(1));
                    newShape.getPath().forEach(function (e) {
                        newShape.ruta += e.toUrlValue(4) + '|';
                    });
                }
                if (newShape.type == 'polyline') {
                    newShape.tipo = 'L';
                    newShape.buffer = '';
                    newShape.ruta = '';
                    newShape.id = coordenadasAHash(newShape.getPath().getAt(1));
                    newShape.getPath().forEach(function (e) {
                        newShape.ruta += e.toUrlValue(4) + '|';
                    });
                }
                if (elementos[newShape.id])
                    elementos[newShape.id].setMap(null);
                elementos[newShape.id] = newShape;
                ultimoAdicionado = newShape;
            });

            function deleteLastPlaced(overlay) {
                overlay.setMap(null);
            }

        }

        function coordenadasAHash(latlng) {
            var parteDecimal1 = parseInt(((latlng.lat() * 100000) % 100000).toString().split('').reverse('').join(''));
            var parteDecimal2 = parseInt(((latlng.lng() * 100000) % 100000).toString().split('').reverse('').join(''));
            return parseInt(parteDecimal1 ^ parteDecimal2).toString();
        }

        function consultarAdicionado() {
            if (ultimoAdicionado == null) return 'null'
            var ret = ultimoAdicionado;
            ultimoAdicionado = null;
            if (ret.type == 'circle') {
                return (ret.id + '&' + ret.tipo + '&' + ret.radio + '&' + ret.centro.toUrlValue());
            }
            if (ret.type == 'polygon') {
                return (ret.id + '&' + ret.tipo + '&' + ret.ruta);
            }
            if (ret.type == 'polyline') {
                return (ret.id + '&' + ret.tipo + '&' + ret.ruta);
            }
        }


        function cambiarColor(id, colorInt, colorExt) {
            id = revStringAJSString(id);
            if (elementos == null || elementos[id] == null) return;
            var elem = elementos[id];
            if (elem.tipo == 'C' || elem.tipo == 'P') {
                if (colorInt) elem.setOptions({
                    fillColor: revStringAJSString(colorInt)
                });
                if (colorExt) elem.setOptions({
                    strokeColor: revStringAJSString(colorExt)
                });
                return 'EXITOCP ' + id + colorInt + colorExt;
            }
            if (elem.tipo == 'L') {
                if (colorExt) elem.setOptions({
                    strokeColor: revStringAJSString(colorExt)
                });

                return 'EXITOL ' + id + colorInt + colorExt;
            }
            return 'ERROR ' + id + colorInt + colorExt;
        }

        function eliminarCerca(id) {
            id = revStringAJSString(id);
            if (elementos && elementos[id]) {
                elementos[id].setMap(null);
                elementos[id] = null;
            }
        }

        function revStringAJSString(s) {
            res = s.toString();
            return res.substring(0, res.length - 1);
        }

        function adicionarCirculo(id ,radio, lat, lng, colorInt, colorExt) {

            for ( i = 0; i < arguments.length; ++i)
                arguments[i] = revStringAJSString(arguments[i]);
                
            if (elementos[id])
            {
                elementos[id].setMap(null); 
                elementos[id] = null;
                return;
            }   
            var center = new google.maps.LatLng(lat, lng);
           
            if (elementos[id])
                elementos[id].setMap(null);
            
            var nuevoCirculo = new google.maps.Circle({
                center : center,
                fillColor : colorInt,
                strokeColor : colorExt,
                radius : parseInt(radio),
                map : map
            });
            
            nuevoCirculo.id = id;
            nuevoCirculo.tipo = 'C';
             
            if (elementos) elementos[id] = nuevoCirculo;

        }
        
        function adicionarLinea(id ,colorInt, colorExt, separador, camino) {        
            
            for ( i = 0; i < arguments.length; ++i)
                arguments[i] = revStringAJSString(arguments[i]);
            if (elementos[id])
            {
                elementos[id].setMap(null); 
                elementos[id] = null;
                return;
            }   
            
            camino = camino.split(separador);
            path = [];
            /*for (i = 0; i < camino.length-1 ; ++i) 
            {
                camino[i] = camino[i].split(',');
                path.push (new google.maps.LatLng(camino[i][0],camino[i][1]));
            }*/
            for (i = 0 ; i < camino.length-1; i+=2)
            {

                path.push (new google.maps.LatLng(camino[i],camino[i+1])); 
            }
            var nuevaLinea = new google.maps.Polyline({
                map:map,
                strokeColor: colorExt,
                path: path
            });
            nuevaLinea.tipo = 'L';
            nuevaLinea.id = id;
            elementos[id] = nuevaLinea;
        }
        
        function adicionarPoligono(id ,colorInt, colorExt, separador, camino) {     
            
            for ( i = 0; i < arguments.length; ++i)
                arguments[i] = revStringAJSString(arguments[i]);
            if (elementos[id])
            {
                elementos[id].setMap(null); 
                elementos[id] = null;
                return;
            }   
            if (elementos && elementos[id])
                elementos[id].setMap(null); 
            camino = camino.split(separador);
            paths = [];
             for (i = 0 ; i < camino.length-1; i+=2)
            {
                paths.push (new google.maps.LatLng(camino[i],camino[i+1])); 
            }
            var nuevaLinea = new google.maps.Polygon({
                map:map,
                strokeColor: colorExt,
                fillColor: colorInt,
                paths: [paths]
            });
            nuevaLinea.tipo = 'P';
            nuevaLinea.id = id
            elementos[id] = nuevaLinea;
            return paths.length;
        }
        window.onload = initialize;
        //]]>
    </script>
<?php include_once('footer.html') ?>

