// Contract parameters that include nested struct param
struct ParamS {
    a: Int;
    s: String?;
}

contract ParamsNested(
    inner: ParamS,
    b: Bool,
    c: Int?
) {
    receive() {}
}