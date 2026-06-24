// contract params with nested struct params
struct StructParam {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
}

contract NestedParams(
    nested: StructParam,
    n: Int?,
    m: Bool?,
) {}
