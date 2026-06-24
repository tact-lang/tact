struct InnerStruct {
    value: Int;
}

contract NestedContract {
    nestedStruct: InnerStruct;

    init() {
        self.nestedStruct = InnerStruct{value: 42};
    }
}