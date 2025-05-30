// contract parameters approach with nested struct
struct ParamStruct {
    x: Int;
    y: Bool;
}

contract ParamsNestedParam(
    nested: ParamStruct,
    amount: Int,
    flag: Bool?
) {}
