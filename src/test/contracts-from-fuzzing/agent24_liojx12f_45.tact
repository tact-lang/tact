// Deep optional chain with mixture, bottom layer filled value
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
            inner: Inner{a: 77}
        }
    };
    init() {}
}