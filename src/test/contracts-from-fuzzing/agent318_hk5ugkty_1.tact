struct NestedStruct {
    innerValue: Int;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{innerValue: 42};
    }
}