struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyFields {
    value: Complex = Complex{
        a: 1,
        b: true,
        c: "hello",
        d: null,
        e: null,
        f: null,
    };

    init() {
        self.value = Complex{
            a: 2,
            b: false,
            c: "world",
            d: 10,
            e: true,
            f: "!",
        };
    }
}