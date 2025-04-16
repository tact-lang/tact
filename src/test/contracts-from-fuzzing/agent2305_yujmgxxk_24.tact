contract NestedOptionals(
    entry: Outer?
) {}

struct Outer {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}
