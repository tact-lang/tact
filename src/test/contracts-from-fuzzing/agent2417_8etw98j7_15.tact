struct A {
    x: Int?;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepChainOption {
    root: C;

    init() {
        self.root = C{ b: B{ a: A{ x: null } } };
    }
}
