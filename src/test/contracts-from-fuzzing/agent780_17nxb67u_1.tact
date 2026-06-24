struct NestedStruct {
    x: Int;
    y: Int?;
}

contract SingleNestedField {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{ x: 1, y: null };
    }
}