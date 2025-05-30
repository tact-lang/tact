struct A {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
}

contract AssignPartial {
    a: A;

    init() {
        self.a = A{ y: 42 };
    }
}
