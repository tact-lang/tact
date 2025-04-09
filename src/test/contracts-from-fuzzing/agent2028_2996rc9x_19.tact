struct Mix1 { a: Int; b: Bool?; c: String }
struct Mix2 { d: Cell?; e: Slice; f: Address? }

struct MixBig {
    m1: Mix1;
    m2: Mix2;
    tag: String;
}

contract NestedMix {
    field: MixBig;

    init() {
        self.field = MixBig{
            m1: Mix1{ a: 10, b: null, c: "hello" },
            m2: Mix2{ d: null, e: emptyCell().asSlice(), f: null },
            tag: "done"
        };
    }
}
