// Nested struct chain deeper with values only
struct InnerMost {
    a: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract Test {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: Middle{
                inner: InnerMost{ a: 42 }
            }
        };
    }
}