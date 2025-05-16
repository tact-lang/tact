struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{a: 10, b: true};
    }
}