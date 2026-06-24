contract ParamsDeep(
    a: Int,
    nested: NestedParam,
) {}

struct NestedParam {
    b: Int;
    c: Bool?;
    d: String;
}
