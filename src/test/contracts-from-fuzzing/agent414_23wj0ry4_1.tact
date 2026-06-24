struct Inner { x: Int; y: Int; }

contract SimpleNested {
    point: Inner;

    init() {
        self.point = Inner{ x: 1, y: 2 };
    }
}