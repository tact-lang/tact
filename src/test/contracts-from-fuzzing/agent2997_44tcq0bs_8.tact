struct Inner {
    x: Int = 1;
}

struct Mid {
    inner: Inner = Inner{};
}

struct Outer {
    mid: Mid = Mid{};
}

contract DeepNest {
    val: Outer = Outer{};
}