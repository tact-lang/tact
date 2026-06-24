struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    z: Int;
}

contract NestedInit {
    val: B;

    init() {
        self.val = B{
            a: A { x: 5, y: true },
            z: 42
        };
    }
}