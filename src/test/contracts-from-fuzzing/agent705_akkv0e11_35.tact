struct Inner {
    a: Int;
}

contract OptionalInnerWrap {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}