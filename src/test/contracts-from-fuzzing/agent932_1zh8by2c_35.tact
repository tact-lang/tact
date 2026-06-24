// test contract parameters together with defaulted optionals + nested struct
struct ParamStruct {
    foo: Int?;
    bar: Bool?;
}

contract ParamsContract(param1: Int, param2: Bool, nested: ParamStruct) {
    // contract parameter syntax used
}