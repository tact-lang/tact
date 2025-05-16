struct InnerMost {
    x: Int?;
}

struct InnerMid {
    i: Int;
    next: InnerMost?;
}

struct InnerTop {
    y: Bool;
    mid: InnerMid?;
}

contract DeepNullNest {
    val: InnerTop?;

    init() {
        self.val = null;
    }
}