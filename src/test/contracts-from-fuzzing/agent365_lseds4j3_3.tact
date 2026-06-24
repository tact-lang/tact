struct Inner {
    flag: Bool;
    value: Int;
}

contract StructInContract {
    nested: Inner;

    init() {
        self.nested = Inner{ flag: true, value: 123 };
    }
}