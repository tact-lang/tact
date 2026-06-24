struct Inner {
    x: Int;
}

contract Test {
    val: Inner?;

    init() {
        self.val = null;
    }
}