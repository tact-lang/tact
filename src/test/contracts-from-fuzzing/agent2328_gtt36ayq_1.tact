struct Inner {
    i1: Int;
    flag: Bool;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{ i1: 42, flag: true };
    }
}