struct C {
    cval: Int;
}

struct B {
    optC: C?;
}

struct A {
    b: B;
}

contract TestContract {
    persist: A;

    init() {
        self.persist = A{ b: B{ optC: C{ cval: 5 } } };
    }
}