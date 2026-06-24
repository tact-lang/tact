struct Inner {
    i: Int;
}

contract OptInner {
    val: Inner?;
    init() {
        self.val = null;
    }
}