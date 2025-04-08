struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    x: Complex?;
    y: Complex;

    init() {
        self.x = null;
        self.y = Complex{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: false,
            f: null,
        };
    }
}