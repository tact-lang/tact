struct TupleLike {
    x: Int;
    y: Int;
    z: Int;
}

contract TestContract {
    point: TupleLike;

    init() {
        self.point = TupleLike{ x: 10, y: 20, z: 30 };
    }
}