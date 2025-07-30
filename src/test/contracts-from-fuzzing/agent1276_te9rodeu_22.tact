struct Foo {
    bar: Bar;     
}

struct Bar {
    baz: Baz;    
}

struct Baz {
    qux: Int?;    
}

contract OptionalsDeep {
    inner: Foo;

    init() {
        self.inner = Foo{ bar: Bar{ baz: Baz{ qux:null } } };
    }
}