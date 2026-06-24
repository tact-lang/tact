struct Inner {
    foo: Int = 0;
    bar: Bool = false;
}

contract Test {
    nested: Inner = Inner{};
}
