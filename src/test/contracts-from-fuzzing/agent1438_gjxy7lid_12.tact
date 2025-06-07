struct Nested {
    score: Int as int16;
    active: Bool;
}

struct MixedCombo {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
    d: Bool;
    e: Bool?;
    f: String?;
    n: Nested;
}

contract ComplexPersistent {
    val: MixedCombo;

    init() {
        self.val = MixedCombo{
            a: 1,
            b: 256,
            c: 123456789,
            d: true,
            e: null,
            f: null,
            n: Nested{
                score: -12345,
                active: false,
            }
        };
    }
}