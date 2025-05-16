struct Foo {
    x: Int;
    y: Int?;
}

contract List {
    a: Foo;
    b: Foo?;
    c: Foo;

    init() {
        self.a = Foo{x:1, y:null};
        self.b = null;
        self.c = Foo{x:2, y:null};
    }
}