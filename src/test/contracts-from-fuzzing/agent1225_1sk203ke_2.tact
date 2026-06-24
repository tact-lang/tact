struct NestedStruct {
    x: Int;
    y: Int?;
}

contract NestedOptionalStructField {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ x: 1, y: null };
    }
}