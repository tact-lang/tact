struct NestedBig {
    inner1: Int;
    inner2: Int;
    inner3: Int;
}

struct Middle {
    nested1: NestedBig;
    nested2: NestedBig;
}

struct Outer {
    mid: Middle;
}

contract DeepWideNested {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid: Middle{
                nested1: NestedBig{inner1:1, inner2:2, inner3:3},
                nested2: NestedBig{inner1:4, inner2:5, inner3:6}
            }
        };
    }
}