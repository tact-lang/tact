struct A {
    foo: Int;
}

struct B {
    bar: Int;
    nested: A;
}

contract MultiNested {
    x: A;
    y: B;

    init() {
        self.x = A{ foo: 10 };
        self.y = B{ bar: 11, nested: self.x };
    }
}