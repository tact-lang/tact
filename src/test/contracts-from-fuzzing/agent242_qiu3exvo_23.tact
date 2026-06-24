struct Inner {
    a: Int? = 17;
    b: Bool? = true;
}

contract StructHasDefaultsInline {
    nested: Inner = Inner{};
}