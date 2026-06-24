struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    d: D?;
}

struct D {
    e: Int?;
}

contract DeepChain {
    a: A;

    init() {
        self.a = A{ b: null };
    }
}
