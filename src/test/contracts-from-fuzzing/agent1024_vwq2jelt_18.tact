struct InnerMost {
    v: Int;
}

struct InnerOpt {
    val: InnerMost?;
}

struct Middle {
    mid: InnerOpt;
}

struct OuterMost {
    top: Middle;
}

contract OptDeepNest {
    x: OuterMost;

    init() {
        self.x = OuterMost{ top: Middle{ mid: InnerOpt{ val: null } } };
    }
}