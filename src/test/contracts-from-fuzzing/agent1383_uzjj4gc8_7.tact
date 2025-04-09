struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
    e: Int?;
}

contract BigType {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: null
        };
    }
}