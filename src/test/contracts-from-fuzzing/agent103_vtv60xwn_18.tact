struct InnerMost {
    num: Int;
}

struct Middle {
    im: InnerMost;
    val: Bool;
}

struct OuterMost {
    mid: Middle;
    txt: String;
}

contract DeepOptional {
    d: OuterMost?;

    init() {
        self.d = null;
    }
}