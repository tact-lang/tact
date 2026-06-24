struct Inner {
    value: Int;
}

contract NestedStruct {
    data: Inner;

    init() {
        self.data = Inner{ value: 123 };
    }
}