﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Proyecto_repaso.WebForm1" %>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0">
    <title>GOOGLE API</title>
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfxPD7VdQYeMQCOL5BhBjKSLZSdbvwRCM&callback=initMap"async defer></script>
	
   <style> 
  	  #map {
        height: 100%;
      }
     
      html, body {

        height: 100%;
        margin: 0;
        padding: 0;
      }
	</style> 
	
</head>

<body>
<!-- Navegador -->
   <seccion id="navegador">
                    <nav class="navbar bg-dark" data-bs-theme="dark">
              <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Mapa</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" >
                        Informacion
                      </a>
                    
                    </li>
                   
                  </ul>
              
                </div>
              </div>
            </nav>
        </seccion>
<!-- Cajas -->
<div class="row" style="background: pink">
    <div class="card">
      <div class="card-body">
        
          <form>
            <div class="mb-3">
               <label for="exampleInputEmail1" class="form-label">Latitud</label>
                <input type="number" class="form-control" id="latitud">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Longitud</label>
                <input type="number" class="form-control" id="longitud">
            </div>
            <button type="submit" class="btn btn-primary">Aceptar</button>
           </form>
       </div>
  
    </div>
</div>
    <!-- Carrusel -->
   <div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/Logo.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/Vidamap.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/Mancha_Urbana.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
      <!--Inicio Mapa-->
    <div id="map" style="width:100%;background:black; height:70%"; padding-top:"2%"></div>
    <script>
        const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        let labelIndex = 0;

        var map;
        function initMap() {

            var latitud = 22.145283;
            var longitud = - 101.015192;

            coordenadas = {
                lng: longitud,
                lat: latitud,
            };

            generarMapa(coordenadas);

        }

        function generarMapa(coordenadas) {

            map = new google.maps.Map(document.getElementById('map'), {
                center: new google.maps.LatLng(coordenadas.lat, coordenadas.lng),
                zoom: 13,
            });
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(coordenadas.lat, coordenadas.lng),
                draggable: true,
                map: map,
                title: 'Zona Universitaria'
            });
            var infowindow = new google.maps.InfoWindow({
                content: "<p>Coordenadas:" + marker.getPosition() + "</p>",
            });
               // Evento para tomar coordenadas al arrastrarse

            marker.addListener('dragend', function (event) {
                document.getElementById("latitud").value = this.getPosition().lat();
                document.getElementById("longitud").value = this.getPosition().lng();
            })

            google.maps.event.addListener(map, "click", (event) => {
                addMarker(event.latLng, map);
            });
            addMarker(bangalore, map);
        }

        function addMarker(location, map) {
            new google.maps.Marker({
                position: location,
                label: labels[labelIndex++ % labels.length],
                map: map,
            });
        }

        window.initMap = initMap;
    </script>
</body>
</html>
