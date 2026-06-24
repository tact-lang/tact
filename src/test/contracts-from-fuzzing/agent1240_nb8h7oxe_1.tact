struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    pos: Inner;
    init() {
        self.pos = Inner{ x: 10, y: null };
    }
}