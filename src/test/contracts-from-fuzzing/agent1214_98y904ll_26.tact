struct Complex {
    a: Int as uint8;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

contract Test26 {
    val: Complex;
    init() {
        self.val = Complex{
            a: 255,
            b: true,
            c: "hello",
            d: null,
            e: false,
        };
    }
}