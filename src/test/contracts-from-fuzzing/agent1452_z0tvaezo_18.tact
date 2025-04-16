struct Foo {
    f1: Int;
}

struct Bar {
    b1: Int;
}

contract ManyStructTypes {
    x: Foo;
    y: Bar;

    init() {
        self.x = Foo{f1: 1};
        self.y = Bar{b1: 2};
    }
}