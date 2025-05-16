// test optional on contract param wrapping struct with a defaulted nested struct
struct NestedDefault {
    x: Int;
    y: Sub?;
}

struct Sub {
    z: Int = 4;
}

contract ParamNestedOptDefault(
    param: NestedDefault?
) {}