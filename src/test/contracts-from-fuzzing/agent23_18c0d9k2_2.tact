struct NestedStruct {
    value: Int;
}

contract NestedStructContract {
    inner: NestedStruct;

    init() {
        self.inner = NestedStruct{ value: 123 };
    }
}