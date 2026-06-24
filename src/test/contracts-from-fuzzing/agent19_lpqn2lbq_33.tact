struct Complex {
    a: Int = 1;
    b: Int?;
    c: Bool?;
    d: String;
    e: String?;
    f: Bool;
}

contract TestContract {
    cmp: Complex;

    init() {
        self.cmp = Complex{
            d: "hi",
            f: true,
        };
    }
}