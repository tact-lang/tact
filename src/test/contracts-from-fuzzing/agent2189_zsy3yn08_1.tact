struct Inner {
    a: Int;
    b: Bool;
}

contract Test1 {
    s: Inner;

    init() {
        self.s = Inner{a: 1, b: true};
    }
}
