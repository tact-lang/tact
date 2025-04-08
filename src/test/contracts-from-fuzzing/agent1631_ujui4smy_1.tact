struct NestedStruct { inner: Int; }

contract SingleField {
    value: NestedStruct;

    init() {
        self.value = NestedStruct{ inner: 42 };
    }
}