struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    s: Inner;
    x: Int;

    init() {
        self.s = Inner{a: 1, b: true};
        self.x = 10;
    }
}