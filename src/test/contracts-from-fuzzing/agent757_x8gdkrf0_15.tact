struct Foo { a: Int = 42; }
message Bar { b: Int = 7; }
struct Baz { c: Int = 8; }

contract TestContract {
    prim: Int = 1;
    foo: Foo;
    optFoo: Foo? = null;
    bar: Bar;
    optBar: Bar? = null;
    baz: Baz = Baz{};
    optBaz: Baz? = null;

    init() {
        self.foo = Foo{};
        self.bar = Bar{};
    }
}