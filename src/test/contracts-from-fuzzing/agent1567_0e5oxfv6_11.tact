struct ParamStruct {
    x: Int;
    y: Bool;
}

contract ParamFields(
    ps: ParamStruct,
    intVal: Int,
    flag: Bool,
    str: String?,
) {
    receive() {
        // no-op
    }
}