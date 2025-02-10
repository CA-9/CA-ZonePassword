Cadev = {}

Cadev.CoreName = 'qb-core'

Cadev.Locations = {
    {
        id = 1,
        name = "Helipad - Pillbox",
        coords = vector3(432.92, -586.2, 28.5),
        distance = 5.0,
        interactDst = 3.0,
        requiresPassword = true,
        password = "ems-heli",
        event = "CA-ALERT",
        uitext = "[E] Access Heli Garage",
    },
    {
        id = 2,
        name = "Helipad - MRPD",
        coords = vector3(481.55, -981.9, 41.01),
        distance = 5.0,
        interactDst = 3.0,
        requiresPassword = true,
        password = "pd-heli",
        event = "CA-ALERT",
        uitext = "[E] Access Heli Garage",
    },
}

Cadev.Zones = {
    {
        name = "City Hall",
        coords = vector3(-551.09, -193.63, 38.22),
        radius = 2.7,
        useZ = true,
        requiresPassword = false,
        password = nil,
        event = "mtc-cityhall:client:open",
    },
    {
        name = "Helipad - MRPD",
        coords = vector3(440.0, -980.0, 30.6),
        radius = 3.0,
        useZ = true,
        requiresPassword = true,
        password = "pd-heli",
        event = "CA-ALERT",
        debugPoly = true,
    },
}
