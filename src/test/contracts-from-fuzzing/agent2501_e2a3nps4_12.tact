struct A {
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

struct D {
    d: C;
}

contract OptionalDeepChain {
    payload: D?;

    init() {
        self.payload = null;
    }
}