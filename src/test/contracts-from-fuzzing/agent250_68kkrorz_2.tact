struct Foo {
    a: Int;
    b: Bool?;
    c: String;
}

contract NestedStructTest {
    foo: Foo;

    init() {
        self.foo = Foo{a: 1, b: null, c: "test"};
    }
}