struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: Int;
}

contract TestContract {
    val: A;

    init() {
        self.val = A{ b: B{ c: C{ d: D{ e: 42 } } } };
    }
}