struct Inner {
    foo: Int;
}

contract DefaultsTest {
    bar: Int = 5;
    baz: Bool = false;
    qux: String = "hello";
    nested: Inner = Inner{foo: 42};
}