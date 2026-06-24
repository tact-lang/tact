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
    e: E;
}

struct E {
    f: Int;
    g: Bool?;
}

contract DeepChainNested {
    inner: A;
    init() {
        self.inner = A{ b: B{ c: C{ d: D{ e: E{ f: 55, g: null } } } } };
    }
}
