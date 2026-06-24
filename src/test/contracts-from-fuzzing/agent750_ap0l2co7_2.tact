struct Inner {
    a: Int;
    b: Bool;
}

contract Deep2 {
    inner1: Inner;
    inner2: Inner;
    init() {
        self.inner1 = Inner{a: 10, b: false};
        self.inner2 = Inner{a: 20, b: true};
    }
}