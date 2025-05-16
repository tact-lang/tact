struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost;
}

struct OuterMost {
    x: Middle;
}

contract MixDefaultOptionalNested {
    obj: OuterMost?;
    init() {
        self.obj = OuterMost{x: Middle{y: InnerMost{z: 5}}};
    }
}