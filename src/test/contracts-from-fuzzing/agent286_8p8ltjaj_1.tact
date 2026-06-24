struct Inner {
    flag: Bool;
    count: Int;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{flag: true, count: 42};
    }
}