// contract with many parameters + nested
struct ParInner {
    p1: Int;
    p2: Bool;
    p3: String?;
}

contract ManyParamNested(
    a: Int,
    b: Bool,
    c: String,
    d: Int?,
    e: Bool?,
    f: String?,
    nested: ParInner,
) {}