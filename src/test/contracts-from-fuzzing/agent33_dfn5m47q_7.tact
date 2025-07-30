struct Foo {
    x: Int;
    y: Int;
}

contract ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Int;
    e: Bool;
    f: Address;
    g: Cell;
    h: Slice;
    i: Foo;
    j: Foo;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = 2;
        self.e = false;
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = Foo{x:3,y:4};
        self.j = Foo{x:5,y:6};
    }
}