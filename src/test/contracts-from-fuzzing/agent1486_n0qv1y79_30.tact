struct InnerMost {
    n: Int?;
}

struct InnerMid {
    im: InnerMost?;
}

struct InnerTop {
    mid: InnerMid?;
}

contract DeeplyNestedOptional {
    val: InnerTop?;

    init() {
        self.val = null;
    }
}