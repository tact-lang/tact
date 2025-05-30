struct Inner {
    p: Int;
    q: Bool;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{p: 1, q: true};
    }
}