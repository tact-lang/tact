struct A {
    n: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepChainNestedPersist {
    data: C;

    init() {
        self.data = C{ b: B{ a: A{ n: 42 } } };
    }
}