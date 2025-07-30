struct B {
    bar: Int;
}

struct A {
    foo: B;
}

contract SameNameFields {
    s1: A;
    s2: B;

    init() {
        self.s1 = A{ foo: B{ bar: 1 } };
        self.s2 = B{ bar: 2 };
    }
}