struct A {
    a: Int = 1;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract DeepDefaultChain {
    x: C;

    init() {
        self.x = C{ c: B{ b: A{} } };
    }
}