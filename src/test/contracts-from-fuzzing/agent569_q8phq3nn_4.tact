struct InnerMost {
    x: Int;
}

struct Middle {
    im: InnerMost;
    s: String;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid1: Middle{im: InnerMost{x: 10}, s: "a"},
            mid2: Middle{im: InnerMost{x: 20}, s: "b"},
        };
    }
}