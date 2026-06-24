struct A {
    x: Int;
    y: Bool?;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepWrap {
    inner: C;

    init() {
        self.inner = C{ b: B { a: A{ x: 99, y: null } } };
    }
}