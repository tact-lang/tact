struct Chain3 {
    x: Int;
    y: Int?;
    inner: Inner?
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract ComplexOpt(
    node: Chain3?
) {}