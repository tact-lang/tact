struct StructWithOptionalInStruct {
    id: Int;
    nested: NestedOptional;
}

struct NestedOptional {
    val: Int?;
}

contract OptionalNestedInner {
    s: StructWithOptionalInStruct = StructWithOptionalInStruct{
        id: 0,
        nested: NestedOptional{ val: null }
    };
}