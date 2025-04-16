struct Inner { x: Int; y: Int; }

contract TestContract {
    point: Inner = Inner{ x: 1, y: 2 };

    init() {
        self.point = Inner{ x: 10, y: 20 };
    }
}