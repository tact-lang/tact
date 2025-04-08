struct InnerWithDefaults {
    a: Int = 1;
    b: Int = 2;
}

contract NestedWithStructDefaults {
    s: InnerWithDefaults = InnerWithDefaults{};
}