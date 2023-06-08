-- MySQL Script generated by MySQL Workbench
-- Model: New Model    Version: 1.0

CREATE DATABASE SaludJEBCA;

USE SaludJEBCA;


-- -----------------------------------------------------
-- Table `Paises`
-- -----------------------------------------------------
CREATE TABLE Paises(
  idpais INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  PRIMARY KEY(idpais)
);




-- -----------------------------------------------------
-- Table `Departamentos`
-- -----------------------------------------------------
CREATE TABLE Departamentos(
  iddepartamento INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  PRIMARY KEY(iddepartamento)
);


-- -----------------------------------------------------
-- Table `Comunidades`
-- -----------------------------------------------------
CREATE TABLE Comunidades(
  idcomunidades INT NOT NULL AUTO_INCREMENT,
  nombre_comunidad VARCHAR(75) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  cantidad_personas INT NULL,
  cantidad_establecimientos INT NULL,
  cantidad_personal INT NULL,
  idpais INT NOT NULL,
  iddepartamento INT NOT NULL,
  PRIMARY KEY(idcomunidades),
  FOREIGN KEY (idpais) REFERENCES Paises(idpais),
  FOREIGN KEY (iddepartamento) REFERENCES Departamentos(iddepartamento)
 );



-- -----------------------------------------------------
-- Table `Medicamentos`
-- -----------------------------------------------------
CREATE TABLE Medicamentos(
  idmedicamento INT NOT NULL AUTO_INCREMENT,
  nombre_medicamento VARCHAR(75) NOT NULL,
  cantidad INT NOT NULL,
  modo_uso VARCHAR(75) NOT NULL,
  tiempo_uso VARCHAR(35) NOT NULL,
  efectos VARCHAR(75),
  fecha_vencimiento DATE NOT NULL,
  PRIMARY KEY(idmedicamento)
);




-- -----------------------------------------------------
-- Table `mydb`.`Inventario`
-- -----------------------------------------------------
CREATE TABLE Inventario(
  idinventario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  stock INT NOT NULL,
  fecha_ingreso DATE NOT NULL,
  idmedicamento INT NOT NULL,
  PRIMARY KEY (idinventario),
  FOREIGN KEY(idmedicamento) REFERENCES Medicamentos(idmedicamento)
);




-- -----------------------------------------------------
-- Table `Establecimientos_Medicos`
-- -----------------------------------------------------
CREATE TABLE Establecimientos_Medicos(
  idestablecimiento_medico INT NOT NULL AUTO_INCREMENT,
  nombre_establecimiento VARCHAR(75) NOT NULL,
  direccion VARCHAR(75) NOT NULL,
  -- horario_apertura DATE NOT NULL,
  -- horario_cierre DATE NOT NULL,
  horario_apertura TIME NOT NULL,
  horario_cierre TIME NOT NULL,
  cantidad_personal INT NULL,
  cantidad_usuarios INT NULL,
  idinventario INT NOT NULL,
  PRIMARY KEY (idestablecimiento_medico),
  FOREIGN KEY(idinventario) REFERENCES Inventario(idinventario)
);


-- -----------------------------------------------------
-- Table `Comunidad_Establecimientos`
-- -----------------------------------------------------
CREATE TABLE Comunidad_Establecimientos(
  idcomunidad_establecimiento INT NOT NULL AUTO_INCREMENT,
  idcomunidad INT NOT NULL,
  idestablecimiento INT NOT NULL,
  PRIMARY KEY(idcomunidad_establecimiento),
  FOREIGN KEY (idcomunidad) REFERENCES Comunidades(idcomunidades),
  FOREIGN KEY (idestablecimiento) REFERENCES Establecimientos_Medicos(idestablecimiento_medico)
 );


-- -----------------------------------------------------
-- Table `Tipos_Sangre`
-- -----------------------------------------------------
CREATE TABLE Tipos_Sangre(
  idtipo_sangre INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(11) NOT NULL,
  PRIMARY KEY(idtipo_sangre)
);


-- -----------------------------------------------------
-- Table `Parentescos`
-- -----------------------------------------------------
CREATE TABLE Parentescos(
  idparentesco INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(25) NOT NULL,
  PRIMARY KEY (idparentesco)
);


-- -----------------------------------------------------
-- Table `Examenes`
-- -----------------------------------------------------
CREATE TABLE Examenes(
  idexamen INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  descripcion VARCHAR(85) NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (idexamen)
);


-- -----------------------------------------------------
-- Table `Sintomas`
-- -----------------------------------------------------
CREATE TABLE Sintomas(
  idsintomas INT NOT NULL AUTO_INCREMENT,
  nivel_sintomas VARCHAR(45) NOT NULL,
  nombre_sintomas VARCHAR(45) NOT NULL,
  duracion_sintomas INT NOT NULL,
  descripcion VARCHAR(100),
  PRIMARY KEY(idSintomas)
);


-- -----------------------------------------------------
-- Table `Enfermedades`
-- -----------------------------------------------------
CREATE TABLE  Enfermedades(
  idenfermedad INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  descripcion VARCHAR(85) NOT NULL,
  fecha_inicio DATE NOT NULL,
  duracion_enfermedad INT NOT NULL,
  idsintomas INT NOT NULL,
  PRIMARY KEY(idenfermedad),
  FOREIGN KEY (idsintomas) REFERENCES Sintomas(idSintomas)
 );



-- -----------------------------------------------------
-- Table `Cirugias`
-- -----------------------------------------------------
CREATE TABLE Cirugias(
  idcirugia INT NOT NULL AUTO_INCREMENT,
  nombre_cirugia VARCHAR(75) NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY(idcirugia)
);




-- -----------------------------------------------------
-- Table `Citas`
-- -----------------------------------------------------
CREATE TABLE Citas(
  idcita INT NOT NULL AUTO_INCREMENT,
  fecha_cita DATE NOT NULL,
  hora_cita DATE NOT NULL,
  PRIMARY KEY(idcita)
);





-- -----------------------------------------------------
-- Table `Roles_Usuarios`
-- -----------------------------------------------------
CREATE TABLE Roles(
  idrol INT NOT NULL AUTO_INCREMENT,
  nombre_rol VARCHAR(45) NOT NULL,
  nivel INT NOT NULL,
  PRIMARY KEY(idrol)
);




-- -----------------------------------------------------
-- Table `Especialidades`
-- -----------------------------------------------------
CREATE TABLE Especialidades(
  idespecialidad INT NOT NULL AUTO_INCREMENT,
  especialidad_medica VARCHAR(50) NOT NULL,
  PRIMARY KEY(idespecialidad)
);




-- -----------------------------------------------------
-- Table `Roles_Personal`
-- -----------------------------------------------------
CREATE TABLE Horarios(
  idhorario INT NOT NULL AUTO_INCREMENT,
  horario_entrada DATE NOT NULL,
  horario_salida DATE NOT NULL,
  hora_entrada TIME NOT NULL,
  hora_salida TIME NOT NULL,
  cupos INT NOT NULL,
  PRIMARY KEY(idhorario)
);




-- -----------------------------------------------------
-- Table `Personal`
-- -----------------------------------------------------
CREATE TABLE Personal(
  idpersonal INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(55) NOT NULL,
  apellido VARCHAR(55) NOT NULL,
  usuario VARCHAR(25) NOT NULL,
  clave VARCHAR(15) NOT NULL,
  genero VARCHAR(10) NOT NULL,
  url_foto VARCHAR(100) NULL,
  idestablecimiento INT NOT NULL,
  idespecialidad INT NOT NULL,
  idrol INT NOT NULL,
  idhorario INT NOT NULL,
  PRIMARY KEY(idpersonal),
  FOREIGN KEY(idestablecimiento) REFERENCES Establecimientos_Medicos(idestablecimiento_medico),
  FOREIGN KEY(idespecialidad) REFERENCES Especialidades(idespecialidad),
  FOREIGN KEY(idrol) REFERENCES Roles(idrol),
  FOREIGN KEY(idhorario) REFERENCES Horarios(idhorario)
);



-- -----------------------------------------------------
-- Table `Historial_Usuarios`
-- -----------------------------------------------------
CREATE TABLE Historial_Usuarios(
  idhistorial_usuario INT NOT NULL AUTO_INCREMENT,
  n_historial VARCHAR(60) NOT NULL,
  observaciones VARCHAR(100) NOT NULL,                   -- datos extras que puede colocar el 
  fecha_historial DATE NOT NULL,
  peso_usuario DOUBLE NOT NULL,
  presion_usuario DOUBLE NOT NULL,
  oxigeno_usuario DOUBLE NOT NULL,
  idmedicamentos INT NOT NULL,
  fecha_medicamento DATE NOT NULL,
  idexamen INT NOT NULL,
  fecha_examen DATE NOT NULL,
  idenfermedad INT NOT NULL,
  fecha_enfermedad DATE NOT NULL,
  idcirugia INT NOT NULL,
  fecha_cirugia DATE NOT NULL,
  idpersonal INT NOT NULL,
  idcita INT NOT NULL,
  PRIMARY KEY(idhistorial_usuario),
  FOREIGN KEY (idmedicamentos) REFERENCES Medicamentos(idmedicamento),
  FOREIGN KEY (idexamen) REFERENCES Examenes(idexamen),
  FOREIGN KEY (idenfermedad) REFERENCES Enfermedades(idenfermedad),
  FOREIGN KEY (idcirugia) REFERENCES Cirugias(idcirugia),
  FOREIGN KEY (idpersonal) REFERENCES Personal(idpersonal),
  FOREIGN KEY (idcita) REFERENCES Citas(idcita)
);




-- -----------------------------------------------------
-- Table `Usuarios`
-- -----------------------------------------------------
CREATE TABLE Usuarios(
  idusuario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  apellido VARCHAR(75) NOT NULL,
  usuario VARCHAR(20) NOT NULL,
  clave VARCHAR(15) NOT NULL,
  edad INT NOT NULL,
  genero VARCHAR(10) NOT NULL,
  telefono INT NOT NULL,
  email VARCHAR(35) NOT NULL,
  url_foto VARCHAR(100) NULL,
  idtipo_sangre INT NOT NULL,
  idparentesco INT NOT NULL,
  idcomunidad INT NOT NULL,
  idhistorial_usuario INT NOT NULL,
  idrol INT NOT NULL,
  PRIMARY KEY(idusuario),
  FOREIGN KEY(idtipo_sangre) REFERENCES Tipos_Sangre(idtipo_sangre),
  FOREIGN KEY(idparentesco) REFERENCES Parentescos (idparentesco),
  FOREIGN KEY (idcomunidad) REFERENCES Comunidades(idcomunidades),
  FOREIGN KEY (idhistorial_usuario) REFERENCES Historial_Usuarios(idhistorial_usuario),
  FOREIGN KEY (idrol) REFERENCES Roles(idrol)
);