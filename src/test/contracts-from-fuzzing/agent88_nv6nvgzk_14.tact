struct Inner {
    k: Int;
}

contract TestContract {
    nested1: Inner;
    nested2: Inner;

    init() {
        self.nested1 = Inner{k: 1};
        self.nested2 = Inner{k: 2};
    }
}