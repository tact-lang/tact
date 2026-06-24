struct A {
    x: Int;
    y: Int;
    z: Int;
}

contract PartialAssign {
    a: A;

    init() {
        self.a = A{ x: 1, y:2, z:3 };
    }
}
