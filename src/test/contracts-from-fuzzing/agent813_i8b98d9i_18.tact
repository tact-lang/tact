struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
}

contract ComplexStorage {
    field: Complex;

    init() {
        self.field = Complex{
            a: 7,
            b: null,
            c: "hello",
            d: true,
            e: null
        };
    }
}