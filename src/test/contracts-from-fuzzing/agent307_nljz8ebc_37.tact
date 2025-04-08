struct C {
    a: Int;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract DeepNest3 {
    root: A;
    init() {
        self.root = A{ b: B{ c: C{ a: 77 } } };
    }
}