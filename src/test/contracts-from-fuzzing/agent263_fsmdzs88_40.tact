struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
}

struct Middle {
    x: Inner;
}

struct OuterMost {
    w: Middle;
}

contract DeepAssigns {
    s: OuterMost;

    init() {
        self.s = OuterMost{w:Middle{x:Inner{y:InnerMost{z:123}}}};
    }
}