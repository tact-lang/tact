struct A { x: Int; y: Int; }

contract TestContract {
    point: A;

    init() {
        self.point = A{ x: 1, y: 2 };
    }
}
