struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    val: Inner;

    init() {
        self.val = Inner{ x: 10, y: true };
    }
}