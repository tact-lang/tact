struct IntWrap {
    a: Int;
    b: Int;
}

struct OptWrap {
    iw: IntWrap?;
    c: Int;
}

contract OptionalWrapContract {
    val: OptWrap;
    init() {
        self.val = OptWrap{ iw: null, c: 5 };
    }
}