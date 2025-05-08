struct Inner {
    val: Int = 777;
}

struct Outer {
    nested: Inner = Inner{};
}

contract NestedStructDefaults {
    s: Outer = Outer{};
}