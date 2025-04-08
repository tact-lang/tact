struct A {
    a1: Int;
}

struct B {
    b1: Int;
    inner: A;
}

struct C {
    c1: Int;
    innerB: B;
}

contract MultiNested {
    myC: C;
    init() {
        self.myC = C{ c1: 1, innerB: B{ b1: 2, inner: A{ a1: 3 } } };
    }
}