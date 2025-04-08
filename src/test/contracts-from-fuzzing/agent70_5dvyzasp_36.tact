message(100) MsgInner {
    x: Int;
}

struct Wrapper {
    inner: MsgInner;
}

contract C {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: MsgInner{ x:1 } };
    }
}