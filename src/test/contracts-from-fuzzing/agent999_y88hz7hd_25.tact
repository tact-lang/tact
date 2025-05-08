contract OverlapNamesTest {
    foo: Int;
    bar: Foo;

    init() {
        self.foo = 123;
        self.bar = Foo { val: 456 };
    }
}

struct Foo {
    val: Int;
}