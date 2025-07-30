struct Foo {
    a: Int;
    b: Bool;
}

contract LargeTuple {
    f1: Foo;
    f2: Foo;
    f3: Foo;
    f4: Foo;
    f5: Foo;
    f6: Foo;
    f7: Foo;
    f8: Foo;
    
    init() {
        self.f1 = Foo{a:1, b:true};
        self.f2 = Foo{a:2, b:false};
        self.f3 = Foo{a:3, b:true};
        self.f4 = Foo{a:4, b:false};
        self.f5 = Foo{a:5, b:true};
        self.f6 = Foo{a:6, b:false};
        self.f7 = Foo{a:7, b:true};
        self.f8 = Foo{a:8, b:false};
    }
}
