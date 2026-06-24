struct Complex {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: null,
            b: true,
            c: null,
            d: 10,
            e: false,
            f: "done"
        };
    }
}