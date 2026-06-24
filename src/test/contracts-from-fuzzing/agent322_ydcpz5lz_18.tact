struct Inner {
    val: Int;
}

contract Test {
    stored: Inner?;

    init() {
        self.stored = null;
    }

    receive() {
        self.stored = Inner{val: 42};
    }
}