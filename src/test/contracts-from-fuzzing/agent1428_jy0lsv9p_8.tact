struct NullableStruct {
    x: Int;
}

contract OptionalStructField {
    f: NullableStruct?;

    init() {
        self.f = NullableStruct{ x: 17 };
    }
}