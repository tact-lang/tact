struct NullableStruct {
    value: Int;
}

contract OptionalNestedStruct {
    data: NullableStruct?;
    init() {
        self.data = NullableStruct{
            value: 42
        };
    }
}