struct A {
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract TestContract {
    nested: C;
    init() {
        self.nested = C{ c: B{ b: A{ a: 42 } } };
    }
}