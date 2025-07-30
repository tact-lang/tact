// Deep optional chain with explicit inner chain null
struct Inner {
    val: Int?;
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
            inner: null
        }
    };
    init() {}
}