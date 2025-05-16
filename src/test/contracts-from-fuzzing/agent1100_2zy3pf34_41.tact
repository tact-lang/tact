struct A {
    val: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeeplyNested {
    c: C;

    init() {
        self.c = C{ b: B{ a: A{ val: 0 } } };
    }
}
