struct ParamStruct {
    a: Int? = null;
    b: String = "abc";
}

contract ParamOptField(
    param: ParamStruct?,
) {}
