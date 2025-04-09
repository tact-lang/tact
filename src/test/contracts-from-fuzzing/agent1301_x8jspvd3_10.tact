struct SInner {
    a: Int;
}

struct SWrap {
    a: SInner;
}

contract TestContract {
    a: SInner;
    b: SWrap;

    init() {
        self.a = SInner{ a: 42 };
        self.b = SWrap{ a: self.a };
    }
}