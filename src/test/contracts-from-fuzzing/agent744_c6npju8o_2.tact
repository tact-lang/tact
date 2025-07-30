struct NestedStruct {
    nestedField: Int;
}

contract WithNestedStruct {
    myStruct: NestedStruct;

    init() {
        self.myStruct = NestedStruct{
            nestedField: 42,
        };
    }
}