struct Inner { x: Int; y: Int; }

contract Test1 {
    pt: Inner;

    init() {
        self.pt = Inner{ x: 1, y: 2 };
    }
}