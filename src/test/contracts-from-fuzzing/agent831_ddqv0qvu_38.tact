struct ParamStruct {
    x: Int;
    a: Bool;
}

contract ParamContract(
    num: Int,
    s: String,
    optional: Int?,
    nested: ParamStruct
) {}