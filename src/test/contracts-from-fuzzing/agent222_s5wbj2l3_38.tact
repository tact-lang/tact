struct Deep {
    nested: Middle;
}

struct Middle {
    inner: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Bool;
}

contract ThreeNest {
    val: Deep;

    init() {
        self.val = Deep{
            nested: Middle{
                inner: InnerMost{
                    x: 100,
                    y: true
                }
            }
        };
    }
}