struct Sub {
    a: Int?;
    b: Bool;
}

struct Complex {
    x: Sub;
    y: Bool?;
    z: String;
}

contract ParamStorage(
    stuff: Complex,
) {}