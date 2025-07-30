struct ParamStruct {
    foo: Int;
    bar: String?;
}

contract ParamTest(
    id: Int,
    data: ParamStruct?,
) {
    receive() { }
}