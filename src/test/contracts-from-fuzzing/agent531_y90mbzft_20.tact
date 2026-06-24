struct InnerMost {
    x: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract NestedLayers {
    nest: Outer;

    init() {
        self.nest = Outer{
            mid: Middle{
                inner: InnerMost{
                    x: 5
                }
            }
        };
    }
}