struct A {
    val1: Int;
}

struct B {
    inner: A;
}

struct C {
    inner: B;
}

struct D {
    inner: C;
}

struct E {
    inner: D;
}

contract ManyDeepNest {
    data: E;

    init() {
        self.data = E{inner: D{inner: C{inner: B{inner: A{val1: 42}}}}};
    }
}