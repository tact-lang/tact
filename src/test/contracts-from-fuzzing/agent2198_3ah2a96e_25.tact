struct NestedStruct { x: Int; }

contract OptionalStructField {
    data: NestedStruct?;
    init() {
        self.data = NestedStruct{x: 7};
    }
}