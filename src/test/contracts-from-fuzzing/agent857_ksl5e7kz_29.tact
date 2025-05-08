struct NestedDefaults {
    foo: Int = 7;
    bar: Bool = true;
    baz: String = "x";
}

struct WithNested {
    inner: NestedDefaults = NestedDefaults{};
}

contract TestContract {
    nested: WithNested = WithNested{};
}