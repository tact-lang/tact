struct Inner { x: Int; }

contract Test {
    field: Inner;

    init() {
        self.field = Inner{ x: 1 };
    }
}