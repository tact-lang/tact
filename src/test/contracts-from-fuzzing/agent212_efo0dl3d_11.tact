struct Complex {
    a: Int;
    b: Bool = false;
    c: String = "abc";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    st: Complex;

    init() {
        self.st = Complex{
            a: 42,
            d: null,
            e: null,
            f: null,
        };
    }
}