<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
<!ENTITY nbsp   "&#160;">
<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    
    <html lang="en">
      
      <head>
        <link rel="icon" href="img/logo-adif_1-1.jpg" class="text-white" />
        <title>Adif/Talavera</title>
        <!-- Required meta tags -->
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
        <link rel="stylesheet" href="style.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <script>
          function ocultarEstaciones() {
          const elements = [];
          
          document.querySelectorAll('[id]')
          .forEach(element => elements.push(element));
          
          elements
          .filter(element => element.attributes.id.value.match(/cont-estacion.*/))
          .forEach(element => element.style.display = 'none');
          }                   
        </script>
        <script>
          function mostrarEstacion(elemid) {
          const elements = [];
          
          document.querySelectorAll('[id]')
          .forEach(element => elements.push(element));
          
          elements
          .filter(element => element.attributes.id.value.match(/cont-estacionelemid))
          .forEach(element => element.style.display = 'block');
          }
        </script>
      </head>
      
      <body>
        <div id="cont-principal" class="container-fluid p-0 m-0">
          <nav class="navbar navbar-expand-md navbar-light bg-white d-flex justify-content-center">
            <div class="d-flex flex-fill">
              <div class="mx-2 p-1 d-none d-md-inline-flex" id="logo-ministerio">
                <a class="mx-auto" href="#"><img src="img/logo-ministerio.jpg" alt="logo-ministerio" /></a>
              </div>
              <div class="mx-2 p-1" id="logo-adif">
                <a class="mx-auto" href="#"><img src="img/logo-adif.jpg" alt="logo-adif" /></a>
              </div>
            </div>
            <div class="flex-fill text-center">
              <a class="navbar-brand text-center" href="#">RENFE</a>
            </div>
            <div class="flex-fill text-right">
              <i class="fa fa-search" aria-hidden="true"></i>
            </div>
            <div class="flex-fill">
              <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
                      aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
            </div>
          </nav>
          <div class="container-fluid p-0 bg-light">
            <div class="container px-0 py-5 text-success pl-3 pl-md-0">
              <h2>Información al usuario</h2>
              <p class="py-2">INICIO / Información al usuario / Estaciones</p>
            </div>
          </div>          
          <xsl:for-each select="renfe/estaciones/estacion">
            <xsl:choose>
              <xsl:when test="@id = 'cont-estacionE-tal'">
              
                mostrarEstacion(@id);
              </xsl:when>
              <xsl:otherwise>
                ocultarEstaciones();
              </xsl:otherwise>
            </xsl:choose>

            <div id="cont-estacion{@id}" class="container px-sm-3 px-md-2 px-lg-1 px-xl-0 mb-5" style="display: none;">
              <a name="cont-estacion{@id}"/>
              <h1><xsl:value-of select="nombre"/></h1>
              <hr class="bg-dark m-0 mb-4" />
              <div>
                <div class="d-flex d-md-block justify-content-center mb-3">
                  <img class="img-fluid float-md-left px-3 px-md-0 pr-md-3 flex-fill" style="min-height: 35vh; max-height: 35vh;"
                       src="{imagen}" alt="estación{@id}"/>
                </div>
                <p>Las estaciones son algo más que un lugar desde el que subir a un tren o desembarcar del mismo.
                  Además de prestar sus servicios a los viajeros y usuarios, muchas de ellas constituyen una referencia en
                  las localidades donde su ubican.
                </p>
                <p>Aquí se pueden conocer los horarios de llegadas y salidas de la estación, así como los servicios que se
                  ofrecen en su recinto e instalaciones. Para ello acceda a dicha información a través del selector que
                  ponemos a su disposición.
                </p>
                <p><strong>Dirección: </strong><xsl:value-of select="direccion"/></p>
              </div>
            </div>
          </xsl:for-each>
          <div class="container px-sm-3 px-md-2 px-lg-1 px-xl-0 my-5">
            <h2 class="px-0">Descubre los servicios de la estación</h2>
            
            <div class="btn-group btn-group-toggle btn-lg btn-block p-0 shadow-sm bg-success rounded-pill" role="group"
                 data-toggle="buttons">
              <div class="btn-group" role="group">
                <button id="btnGroupDrop1" type="button" class="btn btn-success dropdown-toggle rounded-pill"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  INFORMACION
                </button>
                <div class="dropdown-menu border-0 bg-transparent" aria-labelledby="btnGroupDrop1">
                  <xsl:for-each select="renfe/estaciones/estacion">
                    
                    <a class="dropdown-item p-2 my-1 shadow text-white bg-success rounded-pill" href="#"
                       onclick="ocultarEstaciones();document.getElementById('cont-estacion{@id}').style.display = 'block';">
                      <xsl:value-of select="nombre"/></a>
                    
                  </xsl:for-each>
                </div>
              </div>
              <label class="btn btn-success rounded-pill">
                <input type="radio" name="options" id="option2" autocomplete="off"/> ENTRADAS
              </label>
              <label class="btn btn-success rounded-pill">
                <input type="radio" name="options" id="option3" autocomplete="off"/> SALIDAS
              </label>
            </div>
            
            <div class="row justify-content-center align-items-center pt-3 mt-3 mx-0">
              <div class="col-3">
                <div class="card border-0">
                  <div class="card-body d-flex justify-content-start align-items-center p-0">
                    <h6 class="card-text"><strong>HORA</strong></h6>
                  </div>
                </div>
              </div>
              <div class="col-4">
                <div class="card border-0">
                  <div class="card-body d-flex justify-content-start align-items-center p-0">
                    <h6 class="card-text"><strong>ORIGEN</strong></h6>
                  </div>
                </div>
              </div>
              <div class="col-4">
                <div class="card border-0">
                  <div class="card-body d-flex justify-content-start align-items-center p-0">
                    <h6 class="card-text"><strong>TREN</strong></h6>
                  </div>
                </div>
              </div>
              <div class="col-1 pl-1">
                <div class="card border-0">
                  <div class="card-body d-flex justify-content-start align-items-center p-0">
                    <h6 class="card-text"><strong>VÍA</strong></h6>
                  </div>
                </div>
              </div>
            </div>
            
            <xsl:for-each select="renfe/entradas/entrada">
              <div class="row justify-content-center align-items-center py-3 my-3 mx-0 border rounded-pill shadow-sm bg-light">
                <div class="col-3">
                  <div class="card border-0">
                    <div class="card-body d-flex justify-content-start align-items-center p-0 bg-light">
                      <h6 class="card-text"><xsl:value-of select="hora"/></h6>
                    </div>
                  </div>
                </div>
                <div class="col-4">
                  <div class="card border-0">
                    <div class="card-body d-flex justify-content-start align-items-center p-0 bg-light">
                      <h6 class="card-text">
                        <xsl:variable name="IDorigen"><xsl:value-of select="@origen"/></xsl:variable>
                        <xsl:choose>
                          <xsl:when test="$IDorigen = /renfe/estaciones/estacion/@id">
                            <xsl:value-of select="/renfe/estaciones/estacion[@id = $IDorigen]/nombre"/>
                          </xsl:when>
                          <xsl:otherwise>
                            Origen de viaje no definido
                          </xsl:otherwise>
                        </xsl:choose>
                      </h6>
                    </div>
                  </div>
                </div>
                <div class="col-4">
                  <div class="card border-0">
                    <div class="card-body d-flex justify-content-start align-items-center p-0 bg-light flex-column">
                      <h6 class="card-text pb-0 mb-0">
                        <xsl:variable name="IDtren"><xsl:value-of select="@tren"/></xsl:variable>
                        <xsl:choose>
                          <xsl:when test="$IDtren = /renfe/trenes/tren/@id">
                            RF - <xsl:value-of select="/renfe/trenes/tren[@id = $IDtren]/tipo"/>
                          </xsl:when>
                          <xsl:otherwise>
                            Tipo de tren no definido
                          </xsl:otherwise>
                        </xsl:choose>
                      </h6>
                      <p class="card-text w-25 text-right py-0 m-0"><xsl:value-of select="@tren"/></p>
                    </div>
                  </div>
                </div>
                <div class="col-1">
                  <div class="card border-0">
                    <div class="card-body d-flex justify-content-start align-items-center p-0 bg-light">
                      <h6 class="card-text"><xsl:value-of select="via"/></h6>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:for-each>
            
          </div>
        </div>
        
        <div class="bg-light p-0 m-0 text-center">
          <h4 class="text-dark m-0 py-2">RENFE - ADRINILO</h4>
        </div>
        <footer class="bg-success text-dark p-0 m-0 d-flex align-items-center justify-content-center" style=" opacity: .75;">
          <div class="align-self-center">
            <h6 class="pt-2">Todos los datos empleados en esta practica han sido obtenidos desde la web: <a
                href="https://www.adif.es/w/35200-talavera-de-la-reina?pageFromPlid=335"
                class="text-dark text-decoration-none">adif.es/talavera-de-la-reina</a></h6>
          </div>
        </footer>
        
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous"></script>
      </body>
      
    </html>
    
  </xsl:template>
</xsl:stylesheet>