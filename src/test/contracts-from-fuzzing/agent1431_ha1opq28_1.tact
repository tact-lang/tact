struct NestedStruct {
    nestedField: Int;
    optionalField: Bool?;
}

contract TestContract {
    myStruct: NestedStruct;

    init() {
        self.myStruct = NestedStruct{ nestedField: 1, optionalField: true };
    }
}