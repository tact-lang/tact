struct Foo { x: Int }

contract ListOrder {
    a: Int;
    b: Foo;
    c: Int;
    d: Foo;

    init() {
        self.a = 1;
        self.b = Foo{x: 2};
        self.c = 3;
        self.d = Foo{x: 4};
    }
}