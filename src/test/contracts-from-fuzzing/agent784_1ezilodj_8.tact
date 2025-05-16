struct Inner {
    data: Int = 123;
    tag: String = "tag";
}

struct Outer {
    inner: Inner = Inner{};
    note: String = "hello";
}

contract DeepNestedWithDefaults {
    outer: Outer = Outer{};
}
