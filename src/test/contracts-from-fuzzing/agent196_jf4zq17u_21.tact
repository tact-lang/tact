struct Foo {
    val: Int;
}

contract NullStructField {
    foo: Foo?;

    init() {
        self.foo = null;
    }
}