struct A {
    x: Int;
}

struct B {
    y: Int;
    subA: A;
}

struct C {
    z: Int;
    subB: B;
}

contract DeepChain {
    val: C;

    init() {
        self.val = C{ z:7, subB: B{ y:2, subA: A{ x:1 } } };
    }
}