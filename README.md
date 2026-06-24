# Simulaciones orbitales en Julia

Este proyecto contiene una simulación visual del sistema Sol-Tierra-Luna desarrollada en Julia utilizando GLMakie.

La animación representa una órbita terrestre elíptica, una órbita lunar alrededor de la Tierra y una aproximación visual al concepto de baricentro.

## Vista previa

<p align="center">
  <img src="./rotacion_tierra_kepler_luna_baricentro.gif" width="700">
</p>

## ¿Qué hace?

La simulación muestra:

- Un Sol ubicado en uno de los focos de la órbita.
- Una órbita terrestre elíptica.
- La Luna orbitando alrededor de la Tierra.
- Un punto rojo que representa un baricentro simplificado del sistema Tierra-Luna.
- Una animación generada mediante GLMakie.

## Conceptos utilizados

Este proyecto se inspira en conceptos reales de mecánica celeste:

- Leyes de Kepler para representar órbitas elípticas.
- Sistema Tierra-Luna modelado mediante un baricentro simplificado.
- Trigonometría para calcular posiciones orbitales.
- Visualización científica utilizando GLMakie.

## Fundamento matemático

La órbita terrestre se aproxima mediante una elipse inspirada en las leyes de Kepler.

$T = 2\pi\sqrt{\frac{a^3}{\mu}}$

Donde:

- T es el período orbital.
- a es el semieje mayor de la órbita.
- μ representa el parámetro gravitacional del cuerpo central.

La órbita lunar se representa mediante una aproximación visual elíptica alrededor de la Tierra con fines educativos.

### Baricentro Tierra-Luna

En la realidad la Luna no orbita exactamente el centro de la Tierra. Ambos cuerpos giran alrededor de un punto común denominado baricentro.

Esta simulación incluye una representación simplificada de dicho concepto para facilitar su visualización.

## Requisitos

- Julia 1.9 o superior.
- GLMakie.

## Instalación

```julia
using Pkg
Pkg.add("GLMakie")
```

## Ejecución

```bash
julia sistema_orbital.jl
```

La ejecución generará una animación en formato MP4.

## Estructura del proyecto

- `sistema_orbital.jl`: script principal de la simulación.

## Notas

El objetivo de este proyecto es educativo y visual. No pretende ser una simulación astronómica físicamente exacta, sino una representación simplificada de conceptos orbitales mediante programación científica en Julia.