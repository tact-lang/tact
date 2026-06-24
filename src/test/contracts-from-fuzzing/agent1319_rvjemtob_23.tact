struct A {
    v: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepStructTest {
    f: C;
    init() {
        self.f = C{ b: B{ a: A{ v: 100 } } };
    }
}