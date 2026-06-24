// param nested struct with optional inside params
struct OptStructParam {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptParams(
    nested: OptStructParam,
    n: Int?,
    b: Bool?,
) {}
