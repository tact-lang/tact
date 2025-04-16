struct NestedStruct {
    inner: Int;
}

contract TestContract {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{ inner: 42 };
    }
}