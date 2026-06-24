struct IntPair { x: Int; y: Int; }

struct BoolStrPair { b: Bool; s: String; }

struct MixedNested {
    p1: IntPair;
    p2: BoolStrPair;
    optionalInner: BoolStrPair?;
}

contract NestedStructCombo {
    state: MixedNested;

    init() {
        self.state = MixedNested{
            p1: IntPair{ x: 10, y: 20 },
            p2: BoolStrPair{ b: true, s: "str" },
            optionalInner: null,
        };
    }
}