contract NestedParam(
    foo: Int,
    bar: Address,
    data: InnerParam
) {}

struct InnerParam {
    a: Int;
    b: Bool;
}