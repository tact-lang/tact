struct Inner { a: Int; }

struct Outer {
    inner: Inner;
    b: Int;
}

contract Test(
    outer: Outer,
) {
    receive() {}
}