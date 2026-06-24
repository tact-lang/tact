struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
    e: Address;
    f: Address?;
    g: Bool?;
    h: String;
}

contract TestContract {
    data: Complex;
    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: myAddress(),
            f: null,
            g: null,
            h: "hello"
        };
    }
}