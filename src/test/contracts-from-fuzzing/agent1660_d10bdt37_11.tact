struct ParamTestStruct {
    a: Int;
    b: Bool;
}

contract ParamTest(
    value: Int,
    flag: Bool,
    nested: ParamTestStruct,
) {
    receive() {
        // do nothing
    }
}