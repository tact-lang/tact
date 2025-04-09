contract OptionalNestedParam(
    data: InnerParam?
) {}

struct InnerParam {
    a: Int;
    b: Bool;
}