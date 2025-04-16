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

contract OptContract {
    data: Complex;
    init() {
        self.data = Complex{
            a: 5,
            b: false,
            c: myAddress(),
            d: "test",
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}