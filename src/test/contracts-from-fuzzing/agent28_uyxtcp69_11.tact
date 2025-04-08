struct SomeStruct {
    foo: Int;
    bar: String?;
}

contract NullableParam(
    param: SomeStruct?,
) {}