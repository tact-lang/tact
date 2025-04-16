contract NestedParams(
    nest: Outer
) {
    receive() {}
}

struct Outer {
    a: Int;
    inr: Inner;
}

struct Inner {
    flag: Bool;
}