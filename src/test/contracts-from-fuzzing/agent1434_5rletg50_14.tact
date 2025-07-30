struct A {
    inner: B;
}
struct B {
    inner: C;
}
struct C {
    inner: D;
}
struct D {
    x: Int;
}
contract DeepChain {
    v: A;
    init() {
        self.v = A{ inner: B{ inner: C{ inner: D{ x:123 } } } };
    }
}