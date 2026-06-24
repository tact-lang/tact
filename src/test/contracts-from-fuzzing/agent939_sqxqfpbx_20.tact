struct Inner {
    i: Int;
}

contract OptNested {
    val: Inner?;

    init() {
        self.val = null;
    }
}