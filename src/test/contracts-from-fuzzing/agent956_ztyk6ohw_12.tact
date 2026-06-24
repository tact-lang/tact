struct A {
    a1: Int;
}
struct B {
    b1: A;
}
struct C {
    c1: B;
}
struct D {
    d1: C;
}
struct E {
    e1: D;
}

contract FiveLevelNested {
    root: E;
    init() {
        self.root = E{ e1: D{ d1: C{ c1: B{ b1: A{ a1: 7 } } } } };
    }
}
