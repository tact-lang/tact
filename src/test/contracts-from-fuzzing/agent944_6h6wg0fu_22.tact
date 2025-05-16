struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
}

contract ComposeParams(
    one: S1,
    two: S2,
) {
}