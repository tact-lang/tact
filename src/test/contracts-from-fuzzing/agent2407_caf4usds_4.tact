struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    s1: Inner;
    s2: Inner;

    init() {
        self.s1 = Inner{a: 1, b: true};
        self.s2 = Inner{a: 2, b: false};
    }
}