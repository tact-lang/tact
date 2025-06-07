struct Inner {
    foo: Int = 42;
    bar: Int?;
    baz: Bool = false;
    qux: Bool?;
    str: String = "";
    addr: Address?;
}

contract Test {
    nested: Inner = Inner{};
}
