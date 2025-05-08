struct ParamStruct {
    a: Int;
    b: Bool;
}

contract ParamExample(
    field1: Int,
    field2: Bool,
    nested: ParamStruct
) {
    receive() {
        // no-op
    }
}