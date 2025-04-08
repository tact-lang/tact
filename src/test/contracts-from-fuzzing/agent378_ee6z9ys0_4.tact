struct Complex {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String;
}

contract TestContract {
    var: Complex;

    init() {
        self.var = Complex {
            a: 1,
            b: "abc",
            c: false,
            d: null,
            e: true,
            f: "xyz",
        };
    }
}