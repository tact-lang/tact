struct NestedStruct {
    x: Int;
}

contract StructDefaultAssignment {
    data: NestedStruct = NestedStruct{x: 10};

    init() {
        self.data = NestedStruct{x: 20};
    }
}