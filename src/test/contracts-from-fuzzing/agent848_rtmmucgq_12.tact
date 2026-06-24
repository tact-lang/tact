struct NullableStruct {
    foo: Int;
}

contract NullableField {
    data: NullableStruct?;

    init() {
        self.data = NullableStruct{foo: 10};
    }
}