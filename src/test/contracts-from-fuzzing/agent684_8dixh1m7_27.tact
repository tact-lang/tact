contract MultipleStructsTest {
    struct1: A;
    struct2: B;

    init() {
        self.struct1 = A { x: 1 };
        self.struct2 = B { y: true };
    }
}

struct A {
    x: Int;
}

struct B {
    y: Bool;
}