struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: String;
}

contract OptionalFields {
    optData: Complex?;

    init() {
        self.optData = Complex{
            a: 5,
            b: false,
            c: "hello",
            d: true,
            e: "world"
        };
    }
}