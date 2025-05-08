struct Foo { x: Int = 0; }

contract TestImplicitNullNestedOptional {
    foo: Foo?;

    init() {
        self.foo = Foo{x: 7};
    }
}