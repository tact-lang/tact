struct A {
    x: Int;
    y: B;
}

struct B {
    z: Int;
}

contract NestedOrder {
    val: A;

    init() {
        self.val = A {
            x: 5,
            y: B { z: 10 }
        };
    }
}