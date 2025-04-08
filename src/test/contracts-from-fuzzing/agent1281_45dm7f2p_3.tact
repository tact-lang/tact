struct Complex {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract LargeStructStorage {
    field: Complex;

    init() {
        self.field = Complex{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hello",
            e: null,
            f: false,
            g: null,
            h: null,
        };
    }
}