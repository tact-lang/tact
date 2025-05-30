struct InnerMost {
    z: Int;
}

struct Inner {
    y1: InnerMost;
    y2: InnerMost;
}

struct Middle {
    x: Inner;
}

contract InheritLayers {
    top: Middle;

    init() {
        self.top = Middle{
            x: Inner{
                y1: InnerMost{z:1},
                y2: InnerMost{z:2}
            }
        };
    }
}