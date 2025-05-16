struct Foo {
    s: String;
}

contract OptNestedString {
    foo: Foo?;

    init() {
        self.foo = Foo{s: "hi"};
    }
}
