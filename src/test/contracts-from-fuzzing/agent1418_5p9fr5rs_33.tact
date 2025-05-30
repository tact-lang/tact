struct Foo1 {
    x: Int;
}

struct Foo2 {
    x: Foo1;
}

struct Foo3 {
    x: Foo2;
}

struct Foo4 {
    x: Foo3;
}

struct Foo5 {
    x: Foo4;
}

contract FiveDeep {
    f: Foo5;

    init() {
        self.f = Foo5{ x: Foo4{ x: Foo3{ x: Foo2{ x: Foo1{ x: 42 } } } } };
    }
}