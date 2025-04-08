struct SInner {
    val: Int;
}

struct SMiddle {
    left: SInner;
    right: SInner;
}

contract TestContract {
    m: SMiddle;

    init() {
        self.m = SMiddle{
            left: SInner{ val: 1 },
            right: SInner{ val: 2 }
        };
    }
}