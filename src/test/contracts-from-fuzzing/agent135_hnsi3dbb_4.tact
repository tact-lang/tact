struct A {
    v1: Int;
}

struct B {
    v2: Int?;
}

struct C {
    a: A;
    b: B;
}

contract Test {
    c: C;

    init() {
        self.c = C{ a: A{ v1: 42 }, b: B{ v2: null } };
    }
}