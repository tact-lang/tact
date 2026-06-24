struct Foo {
    a: Int = 1;
}
struct Bar {
    f: Foo;
}
contract NestedDefaults {
    r: Bar;
    init() {
        self.r = Bar{ f: Foo{} };
    }
}