// test hybrid: param with nested struct with optional of struct
struct Inner {
    x: Int;
}

struct Mid {
    inn: Inner?;
}

contract MixParamNestedOpt(
    mid: Mid?,
    p: Int?,
) {}
