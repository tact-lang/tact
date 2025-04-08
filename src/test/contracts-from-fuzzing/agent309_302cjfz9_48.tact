struct Foo { a:Int; }

struct Bar {
    foo:Foo;
    bar:Int;
}

struct Baz {
    bar:Bar;
    bb:Bool;
}

contract NestedChain {
    baz:Baz;
    init() {
        self.baz = Baz{ bar: Bar{ foo: Foo{a:3}, bar:5 }, bb:false };
    }
}