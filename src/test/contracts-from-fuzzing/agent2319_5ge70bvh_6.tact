struct Inner {
    q: Int?;
    s: String;
}

struct Outer {
    val: Int;
    nested: Inner;
}

contract TestContract(
    p1: Int,
    p2: Bool,
    info: Outer,
) {
    receive() { }
}
