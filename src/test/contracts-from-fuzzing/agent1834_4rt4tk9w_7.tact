struct Inner {
    x: Int;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract Test {
    data: Outer?;

    init() {}
}