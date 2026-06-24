struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: false,
            c: "str",
            d: myAddress(),
            e: 2,
            f: null,
            g: null,
            h: null
        };
    }
}