struct Foo {
    bar: Int?;
    baz: Int?;
}

contract OptStructDefaults {
    s: Foo;

    init() {
        self.s = Foo{bar:null,baz:null};
    }
}