struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    coord: Inner;
    init() {
        self.coord = Inner{ x: 1, y: null };
    }
}