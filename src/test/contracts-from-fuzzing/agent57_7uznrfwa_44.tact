struct SmallIntStruct {
    x: Int as int64;
    y: Int;
}

contract ParamStructWithSerialization(
    inner: SmallIntStruct,
) {}
