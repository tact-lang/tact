struct Inner {
    value: Int;
}

contract TestContract {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
    nested4: Inner;

    init() {
        self.nested1 = Inner{ value: 10 };
        self.nested2 = Inner{ value: 20 };
        self.nested3 = Inner{ value: 30 };
        self.nested4 = Inner{ value: 40 };
    }
}