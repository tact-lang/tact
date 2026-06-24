struct S {
    a: Int;
    b: Bool?;
}

contract NestedOptionalBool {
    s: S = S{ a: 1, b: null };
}