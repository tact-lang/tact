struct Complex {
    a: Int;
    b: String?;
    c: Bool;
    d: String?;
    e: Int;
}

contract ComplexDefaults {
    field: Complex = Complex{
        a: 0,
        b: null,
        c: true,
        d: null,
        e: -1,
    };
}