struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract EmbeddedAssign {
    storage: C;
    init() {
        self.storage = C{ b: B{ a: A{ x: -12345 } } };
    }
}
