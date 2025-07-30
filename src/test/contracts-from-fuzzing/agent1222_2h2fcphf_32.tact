struct Inner {
    value: Int;
}

contract FieldOverwrite {
    f: Inner;

    init() {
        self.f = Inner{ value: 1 };
        self.f = Inner{ value: 2 };
    }
}