struct A {
    x: Int;
}
struct B {
    y: A;
}
struct C {
    z: B;
}
struct D {
    w: C;
}

contract DeepChainNested {
    val: D;

    init() {
        self.val = D{ w: C{ z: B{ y: A{ x: 42 }}}};
    }
}
