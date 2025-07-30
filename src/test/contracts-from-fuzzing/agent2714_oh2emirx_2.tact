struct Inner {
    x: Int;
    y: Bool;
}

contract Test2 {
    data: Inner;

    init() {
        self.data = Inner{ x: 5, y: false };
    }
}