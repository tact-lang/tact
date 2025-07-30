struct BoolIntPair {
    b: Bool;
    i: Int;
}

struct NestedBoolIntOpt {
    pair: BoolIntPair?;
    other: Int?;
}

contract TestComplexOptionals {
    data: NestedBoolIntOpt;

    init() {
        self.data = NestedBoolIntOpt{
            pair: BoolIntPair{ b: true, i: 77 },
            other: null
        };
    }
}
