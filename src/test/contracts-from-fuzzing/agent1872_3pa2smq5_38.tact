// Contract parameters with nested struct
struct ParamWith {
    a: Int;
    s: String?;
}
contract ParamsNested(
    inner: ParamWith,
    flag: Bool,
) {}