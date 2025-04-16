struct NestedParam {
    foo: Int?;
    bar: Bool = true;
}

contract ParamStruct(
    val: NestedParam,
) {
    receive() {}
}