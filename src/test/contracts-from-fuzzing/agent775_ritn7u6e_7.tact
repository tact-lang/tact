struct ParamStruct {
    foo: Int;
    bar: Bool?;
    baz: String?;
}

contract ParamContract(
    count: Int,
    nested: ParamStruct,
    flag: Bool,
    maybeText: String?,
) {}