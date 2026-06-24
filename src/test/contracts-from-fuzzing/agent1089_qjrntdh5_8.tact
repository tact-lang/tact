struct Inner {
    flag: Bool = true;
    count: Int = 42;
}

struct Outer {
    label: String = "test";
    inner: Inner = Inner{};
}

contract DeepNestedStorage {
    outer: Outer = Outer{};
}