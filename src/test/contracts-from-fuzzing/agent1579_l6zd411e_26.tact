struct Foo {
    a: Int;
}

struct Bar {
    b: Bool;
}

contract ManyStructs {
    f: Foo;
    g: Bar;
    h: Foo;
    i: Bar;

    init() {
        self.f = Foo{a:1};
        self.g = Bar{b:true};
        self.h = Foo{a:2};
        self.i = Bar{b:false};
    }

    receive() {
        self.h.a += 2;
    }
}