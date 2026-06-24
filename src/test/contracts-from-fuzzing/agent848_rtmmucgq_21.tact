struct StructDefaultedNested {
    nested: NullableStruct? = null;
}

struct NullableStruct {
    foo: Int;
}

contract StructWithDefaultedOptionalNested {
    data: StructDefaultedNested;

    init() {
        self.data = StructDefaultedNested{};
    }
}