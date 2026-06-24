struct Complex {
    a: Int?;
    b: Bool;
    c: String?;
    d: Nested;
}

struct Nested {
    x: Int;
    y: String;
    z: Bool?;
}

contract ComplexPersist {
    data: Complex;

    init() {
        self.data = Complex{
            a: null,
            b: true,
            c: "hi",
            d: Nested{
                x: 3,
                y: "nested",
                z: false,
            },
        };
    }
}