// contract with contract parameter list using struct param
struct ParamStruct {
    val: Int;
    txt: String;
}

contract TestContract(
    ps: ParamStruct,
    flag: Bool,
    count: Int
) {
}
