struct A { 
    v: Int;
}

struct B {
    w: Int;
}

contract Test13 {
    foo: A?;
    bar: B?;
    baz: A?;
    qux: Int?;

    init() {
        self.foo = A{v: 1};
        self.bar = null;
        self.baz = null;
        self.qux = null;
    }
}