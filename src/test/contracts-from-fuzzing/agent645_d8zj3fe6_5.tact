struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Int;
    h: Bool?;
    i: String;
}

contract MixTest {
    field: Complex;

    init() {
        self.field = Complex{
            a: 1,
            b: null,
            c: "hi",
            d: 2,
            e: true,
            f: null,
            g: 3,
            h: false,
            i: "bye",
        };
    }
}
