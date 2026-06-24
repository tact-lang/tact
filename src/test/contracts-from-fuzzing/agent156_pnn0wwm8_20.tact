struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    d: Int?;
}

contract DeepOptionalsTest {
    a: A;

    init() {
        self.a = A{ b: B{ c: C{ d: 7 } } };
    }
}
