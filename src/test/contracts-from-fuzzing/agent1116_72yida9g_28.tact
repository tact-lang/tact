// Test struct having both required and optional nested struct fields
struct InnerX {
    v: Int;
}

struct InnerY {
    v: Int;
}

struct OuterMix {
    a: InnerX; // required nested
    b: InnerY?; // optional nested
}

contract MixedNested {
    item: OuterMix;

    init() {
        self.item = OuterMix {
            a: InnerX{v:1},
            b: null
        };
    }
}
