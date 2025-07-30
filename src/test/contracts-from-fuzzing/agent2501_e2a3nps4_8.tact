struct IntContainer {
    value: Int;
}

struct BoolContainer {
    flag: Bool;
}

struct ComboNest {
    a: IntContainer;
    b: BoolContainer;
    c: IntContainer?;
    d: BoolContainer?;
}

contract MixedOptionalNested {
    combo: ComboNest;

    init() {
        self.combo = ComboNest{
            a: IntContainer{ value: 1 },
            b: BoolContainer{ flag: true },
            c: null,
            d: null
        };
    }
}