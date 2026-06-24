struct Complex {
    i: Int;
    o: Int?;
    b: Bool;
    s: String;
    o2: Bool?;
    s2: String?;
}

contract ComplexDefaults {
    val: Complex = Complex{
        i: 5,
        o: null,
        b: true,
        s: "test",
        o2: null,
        s2: null
    };
}