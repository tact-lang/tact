struct BoolVariants {
    a: Bool;
    b: Bool?;
}

struct IntVariants {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int?;
}

contract TestContract {
    bools: BoolVariants;
    ints: IntVariants;

    init() {
        self.bools = BoolVariants{
            a: true,
            b: null
        };

        self.ints = IntVariants{
            a: 10,
            b: 20,
            c: 30,
            d: null
        };
    }
}