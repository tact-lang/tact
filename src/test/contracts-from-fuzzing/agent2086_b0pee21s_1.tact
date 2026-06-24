struct NestedStruct {
    flag: Bool;
    number: Int;
}

contract SingleNestedField {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ flag: true, number: 42 };
    }
}