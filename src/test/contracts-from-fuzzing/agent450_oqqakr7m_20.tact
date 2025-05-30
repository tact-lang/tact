struct Gamma {
    z: Int;
}

struct Beta {
    y: Gamma;
}

struct Alpha {
    x: Beta;
}

contract NestedParams(
    a: Alpha,
    g: Gamma,
) {}