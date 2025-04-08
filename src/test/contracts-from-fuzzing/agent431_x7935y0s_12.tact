struct InnerStruct {
    foo: Int;
    bar: Bool?;
}

contract ComplexParamTest(
    s: InnerStruct?,
    x: Int?,
    y: String,
    z: Bool?,
) {
    receive() {}
}