struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    f1: Foo;
    f2: Foo;
    f3: Foo;
    f4: Foo;
}

contract TestContract {
    many: Bar;
    flag: Bool;
    count: Int;

    init() {
        self.many = Bar{
            f1: Foo{a:1,b:true},
            f2: Foo{a:2,b:false},
            f3: Foo{a:3,b:true},
            f4: Foo{a:4,b:false}
        };
        self.flag = true;
        self.count = 999;
    }
}