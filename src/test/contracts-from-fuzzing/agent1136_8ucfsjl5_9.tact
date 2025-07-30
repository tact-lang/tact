struct NestedParamStruct {
    flag: Bool?;
    info: InfoStruct;
}

struct InfoStruct {
    name: String?;
    value: Int;
}

contract ParamsNestedParam(
    param: NestedParamStruct,
) {
    // no init allowed with parameters syntax
}