struct ComplexCtor {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: String?;
}

contract ComplexParams(
    p1: Int,
    p2: Bool,
    p3: Address,
    p4: Int?,
    p5: String?,
    s: ComplexCtor
) {}