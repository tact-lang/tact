struct InnerMost {
    v: Int;
}

struct MiddleOpt {
    im: InnerMost?;
    flag: Bool;
}

contract OptionalInMiddle {
    val: MiddleOpt;

    init() {
        self.val = MiddleOpt{ im: InnerMost{v:10}, flag: true };
    }
}