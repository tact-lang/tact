struct Middle {
    x: Int;
    y: String;
}
struct Outer {
    m1: Middle;
    m2: Middle;
}
contract NestedStructParams(
    data: Outer
) {}
