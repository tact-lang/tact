struct Inner {
    val: Int;
}

contract OptStructNull {
    val: Inner?;
    init() {
        self.val = null;
    }
}