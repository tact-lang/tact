struct NullableStruct {
    value: Int?;
}

contract NestedOptionals {
    a: NullableStruct?;

    init() {
        self.a = null;
    }
}