struct Foo {
    a: Int;
    b: Int;
    c: Int;
}

contract MultiDefaults {
    d1: Foo = Foo{a:1, b:2, c:3};
    d2: Int = 10;
    d3: Bool = true;

    init() {
        self.d1 = Foo{a:4,b:5,c:6};
        self.d2 = 20;
        self.d3 = false;
    }
}