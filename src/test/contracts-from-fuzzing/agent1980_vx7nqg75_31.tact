struct Foo {
    x: Int;
}

contract SameNameReuse {
    a: Foo;
    b: Foo;
    c: Foo;

    init() {
        self.a = Foo{x:1};
        self.b = Foo{x:2};
        self.c = Foo{x:3};
    }
}