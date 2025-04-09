struct A {
    s1: String?;
}

struct B {
    optA: A?;
}

contract OptStringNest {
    f: B;

    init() {
        self.f = B{ optA: null };
    }
}