struct A {
    i: Int;
}

struct B {
    j: Int;
}

struct C {
    a: A;
    b: B;
    k: Int;
}

contract MultiNested {
    data: C;

    init() {
        self.data = C{ a: A{ i:1 }, b: B{ j:2 }, k:3 };
    }
}
