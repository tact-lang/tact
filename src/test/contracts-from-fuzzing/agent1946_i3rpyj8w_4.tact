struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract Test {
    nested: Inner = Inner{};
}
