struct NullableNested {
    nested: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalInnerStruct {
    nn: NullableNested = NullableNested{nested:null};
}