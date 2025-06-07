struct S1 { x: Int }
struct S2 { y: Int }

struct NestedCombo {
    s1opt: S1?;
    s2: S2;
}

contract NestedOptionalCombo {
    stuff: NestedCombo;

    init() {
        self.stuff = NestedCombo {
            s1opt: null,
            s2: S2 { y: 42 }
        };
    }
}