struct A {
    x: Int;
}

contract DoubleAssign {
    d: A;
    init() {
        self.d = A{ x:1 };
        self.d = A{ x:2 };
    }
}