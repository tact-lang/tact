struct A {
    foo: Int;
}

struct B {
    bar: Int;
}

contract CrossAssignInit {
    a: A;
    b: B;

    init() {
        self.a = A{ foo: 1 };
        self.b = B{ bar: self.a.foo };
    }
}