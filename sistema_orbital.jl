using GLMakie

# estructura de la esfera

mutable struct Esfera
    nombre::String

    radio::Float64
    masa::Float64

    x::Float64
    y::Float64

    vx::Float64
    vy::Float64

    color
end

# Configuracuión de la órbita
a = 1.0      # semieje mayor
b = 0.85     # semieje menor

c = sqrt(a^2 - b^2) # distancia al foco

# Instancias de cuerpos celestes
sol = Esfera(
    "Sol",
    35.0,
    1.989e30,
    -c,
    0.0,
    0.0,
    0.0,
    :orange
)

tierra = Esfera(
    "Tierra",
    20.0,
    5.972e24,
    a,
    0.0,
    0.0,
    0.0,
    :deepskyblue
)

luna = Esfera(
    "Luna",
    8.0,
    7.347e22,
    a + 0.15,
    0.0,
    0.0,
    0.0,
    :lightgray
)

fig = Figure()
ax = Axis(
    fig[1,1],
    aspect=DataAspect(),
    limits=(-1.5, 1.5, -1.5, 1.5)
)

θ = Observable(0.0)

sol_x = Observable(sol.x)
sol_y = Observable(sol.y)

earth_x = Observable(tierra.x)
earth_y = Observable(tierra.y)

moon_x = Observable(luna.x)
moon_y = Observable(luna.y)

barycenter_x = Observable(tierra.x)
barycenter_y = Observable(tierra.y)

scatter!(
    ax,
    sol_x,
    sol_y,
    markersize=sol.radio,
    color=sol.color
)

scatter!(
    ax,
    earth_x,
    earth_y,
    markersize=tierra.radio,
    color=tierra.color
)

scatter!(
    ax,
    moon_x,
    moon_y,
    markersize=luna.radio,
    color=luna.color
)

scatter!(
    ax,
    barycenter_x,
    barycenter_y,
    markersize=4,
    color=:red
)

hlines!(ax, [0], color=:gray)
vlines!(ax, [0], color=:gray)

θ_orbita = range(0, 2π, length=500)
lines!(
    ax,
    a .* cos.(θ_orbita),
    b .* sin.(θ_orbita),
    color=:white
)

moon_a = 0.18
moon_b = 0.13

moon_orbit = Observable(Point2f[])

lines!(ax, moon_orbit, color=:gray)

record(fig, "mini_sistema_solar_luna_baricentrica.mp4", range(0, 2π, length=720)) do t
    θ[] = t

    tierra.x = a * cos(t)
    tierra.y = b * sin(t)

    earth_x[] = tierra.x
    earth_y[] = tierra.y

    # Baricentro simplificado Tierra-Luna
    barycenter_x[] = tierra.x
    barycenter_y[] = tierra.y

    moon_angle = t * 13

    # Órbita lunar elíptica
    luna.x = tierra.x + moon_a * cos(moon_angle)
    luna.y = tierra.y + moon_b * sin(moon_angle)

    moon_x[] = luna.x
    moon_y[] = luna.y

    moon_path = Point2f[]
    for θm in range(0, 2π, length=180)
        push!(moon_path,
            Point2f(
                tierra.x + moon_a * cos(θm),
                tierra.y + moon_b * sin(θm)
            )
        )
    end
    moon_orbit[] = moon_path
end

display(fig)