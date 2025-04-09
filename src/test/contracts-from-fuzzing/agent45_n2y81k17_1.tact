struct Inner {
    field1: Int;
}

contract TestContract {
    nestedStruct: Inner;

    init() {
        self.nestedStruct = Inner{field1: 42};
    }
}