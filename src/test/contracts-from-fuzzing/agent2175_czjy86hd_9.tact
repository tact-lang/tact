struct NestedOptionalStruct {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract StructWithNullableNestedStruct {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{ inner: null };
    }
}