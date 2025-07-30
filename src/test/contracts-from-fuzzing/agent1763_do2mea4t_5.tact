struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract ChainStructs {
    c: C;

    init() {
        self.c = C{ b: B{ a: A{ x: 42 } } };
    }
}