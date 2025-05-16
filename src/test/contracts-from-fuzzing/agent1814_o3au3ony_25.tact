struct Foo {
    a: Int;
}

contract ManyOfOneStruct {
    s1: Foo;
    s2: Foo;
    s3: Foo;
    s4: Foo;

    init() {
        self.s1 = Foo{a:1};
        self.s2 = Foo{a:2};
        self.s3 = Foo{a:3};
        self.s4 = Foo{a:4};
    }
}
