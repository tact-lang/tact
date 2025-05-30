struct Inner {
    foo: Int? = null;
}

struct Outer {
    bar: Inner = Inner{};
}

contract NestedOptNullDefaults {
    val: Outer = Outer{};
}
