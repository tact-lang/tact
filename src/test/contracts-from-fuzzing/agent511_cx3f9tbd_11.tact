struct Complex {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: String;
    i: Bool;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: "b",
            c: true,
            d: null,
            e: null,
            f: null,
            g: 2,
            h: "h",
            i: false
        };
    }
}