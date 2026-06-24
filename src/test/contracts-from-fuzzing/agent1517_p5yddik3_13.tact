struct Inner {
    number: Int as int8;
}

struct Outer {
    name: String;
    maybeInner: Inner?;
}

contract Test(
    outer: Outer,
    count: Int as uint32,
) {
    receive() {}
}