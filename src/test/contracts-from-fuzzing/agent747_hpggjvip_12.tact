struct Complex {
    a: Int?;
    b: String;
    c: Bool?;
    d: FixedSize;
}

struct FixedSize {
    i1: Int as uint8;
    i2: Int as int16;
}

contract TestContract {
    val: Complex;

    init() {
        self.val = Complex {
            a: null,
            b: "test",
            c: true,
            d: FixedSize {
                i1: 7,
                i2: -99,
            },
        };
    }
}