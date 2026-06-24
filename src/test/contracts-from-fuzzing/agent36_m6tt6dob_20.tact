struct InnerMost {
    x: Int;
}

struct MiddleNest {
    y: InnerMost;
}

struct OuterMost {
    z: MiddleNest;
}

contract DeepStructOpt {
    t: OuterMost?;
    init() {
        self.t = null;
    }
}