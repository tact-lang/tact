struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Inner;
}

struct Inner {
    i1: Int;
    i2: Int?;
    i3: String;
    i4: Bool?;
}

contract Test {
    x: Complex;
    init() {
        self.x = Complex{
            a: 100,
            b: null,
            c: "string",
            d: null,
            e: true,
            f: null,
            g: Inner{
                i1: 200,
                i2: null,
                i3: "inner",
                i4: true
            }
        };
    }
}