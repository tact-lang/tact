// check combination: parameters with deep nested structs
struct NestedInParam {
    inner: Inner;
}

struct Inner {
    v: Int;
    b: Bool;
}

contract ParamNested(
    data: NestedInParam,
) {
}