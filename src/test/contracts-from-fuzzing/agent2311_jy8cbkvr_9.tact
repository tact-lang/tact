struct SInner {
    val: Int;
}

contract DefaultVals {
    inner: SInner = SInner{ val: 77 };

    init() {
        self.inner = SInner{ val: 99 };
    }
}