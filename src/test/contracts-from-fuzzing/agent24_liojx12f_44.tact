// Deep optional chain with mixture of empty, null, filled
struct Inner {
    a: Int?;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract Test {
    outer: Outer = Outer{
        mid: Mid{
            inner: Inner{a: null}
        }
    };
    init() {}
}