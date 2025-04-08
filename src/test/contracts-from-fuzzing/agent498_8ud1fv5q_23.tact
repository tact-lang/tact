struct Inner {
    val: Int = 5;
}

struct Outer {
    inner: Inner = Inner{};
}

contract ImplicitDefaults {
    val: Outer = Outer{};
}