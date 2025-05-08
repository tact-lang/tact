struct Inner {
    x: Int;
    y: Int?;
}
struct Outer {
    inr: Inner?;
}

contract CParams(
    p1: Inner?,
    p2: Outer,
    p3: Int,
    p4: Bool,
) {}
