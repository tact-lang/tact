contract SingleInt {
    val: Int;

    init() {
        self.val = 1;
    }
}

// Use persistent storage field
contract TestCaller {
    val: Int = 0;

    receive() {
        self.val = 42;
    }
}