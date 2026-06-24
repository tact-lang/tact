struct ParamStruct {
    bar: Int?;
}

contract NestedMixedOptionalParam(
    foo: Int?,
    nested: ParamStruct?
) {}
