struct A {x: Int}
struct B {y: Bool}
struct C {z: A}
struct D {w: B}

contract TestContract {
    field1: C;
    field2: D;

    init() {
        self.field1 = C{ z: A{ x: 42 } };
        self.field2 = D{ w: B{ y: true } };
    }
}