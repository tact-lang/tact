struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
}

contract TestContract {
    f: Complex;

    init() {
        self.f = Complex{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "hello"
        };
    }
}