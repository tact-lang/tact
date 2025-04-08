struct NestedStruct { inner: Int; }

contract TestContract {
    value: NestedStruct;

    init() {
        self.value = NestedStruct{ inner: 10 };
    }
}