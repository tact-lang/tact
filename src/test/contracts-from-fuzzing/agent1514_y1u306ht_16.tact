struct Foo {
    i: Int;
}

contract Bar {
    f1: Foo = Foo{i:1};
    f2: Foo = Foo{i:2};
    f3: Foo = Foo{i:3};
    f4: Foo = Foo{i:4};
    f5: Foo = Foo{i:5};
    init() {
        self.f1 = Foo{i:11};
        self.f5 = Foo{i:55};
    }
}