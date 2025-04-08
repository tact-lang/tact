struct InnerMost {
    value: Int;
}

struct Inner {
    flag: Bool;
    nested: InnerMost;
}

contract TestContract {
    deepField: Inner;

    init() {
        self.deepField = Inner{ flag: true, nested: InnerMost{ value: 1 } };
    }

    receive() {
        self.deepField = Inner{ flag: false, nested: InnerMost{ value: 2 } };
    }
}