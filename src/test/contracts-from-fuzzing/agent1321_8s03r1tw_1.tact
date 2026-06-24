struct A {
    x: Int;
    y: Int;
}

contract Test {
    point: A;
    init() {
        self.point = A{ x: 1, y: 2 };
    }
}