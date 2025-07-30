struct NestedStruct {
    inner: Int;
}

contract WithNestedStruct {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ inner: 123 };
    }
}