struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    x: Int?;
    im: InnerMost;
    y: String?;
}

contract OptionalMix {
    m: Middle?;
    val: Int;

    init() {
        self.m = null;
        self.val = 42;
    }
}
