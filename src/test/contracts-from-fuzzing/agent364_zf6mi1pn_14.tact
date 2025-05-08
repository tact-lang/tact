struct A {
    x: Int;
}

struct B {
    y: Int;
    inner: A;
}

struct C {
    z: Int;
    deeper: B;
}

contract NestedMultiple {
    data: C;

    init() {
        self.data = C{ z: 7, deeper: B{ y: 8, inner: A{ x: 9 } } };
    }
}