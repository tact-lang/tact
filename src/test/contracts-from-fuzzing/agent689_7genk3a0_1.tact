struct NestedStruct {
    nfield: Int;
}

contract NestedStructStorage {
    nested: NestedStruct;
    init() {
        self.nested = NestedStruct{nfield: 42};
    }
}