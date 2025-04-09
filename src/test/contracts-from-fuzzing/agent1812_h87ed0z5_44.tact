// Nested contract parameter structs
struct NestedParam {
    foo: Int;
    bar: Bool;
    baz: String?;
}

contract NestedParams(
    info: NestedParam
) {}
