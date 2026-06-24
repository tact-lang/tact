struct S1 {
    a: Int;
}

struct S2 {
    s: S1?;
}

contract ParamNestedSOpt(
    p: S2,
) {}
