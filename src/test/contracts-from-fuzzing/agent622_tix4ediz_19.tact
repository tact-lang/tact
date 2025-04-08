struct ParamsStruct {
    foo: Int;
    bar: Bool;
}

contract ParamsSyntax(
    param: ParamsStruct,
    num: Int as uint32,
    optStr: String?
) {}