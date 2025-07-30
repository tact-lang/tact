struct A {
    x: Int;
}
struct B {
    y: Int;
    a: A;
}
struct C {
    z: Int;
    b: B;
}
contract CrossNested {
    s: C;
    init() {
        self.s = C{ z: 7, b: B{ y: 6, a: A{ x: 5 } } };
    }
}