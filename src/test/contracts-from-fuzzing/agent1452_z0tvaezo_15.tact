struct InnerMost {
    x: Int;
}

struct Mid {
    im: InnerMost;
}

struct OuterOpt {
    m: Mid?;
}

contract DeepOptionals {
    val: OuterOpt?;

    init() {
        self.val = null;
    }
}