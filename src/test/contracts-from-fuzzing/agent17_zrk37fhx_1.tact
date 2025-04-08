struct NestedStruct {
    inner: Int;
}

contract TestContract {
    foo: NestedStruct;

    init() {
        self.foo = NestedStruct{ inner: 123 };
    }
}