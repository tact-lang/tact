struct Inner {
    b: Bool;
}

contract OptionalStructVsDefault {
    val: Inner? = null;

    init() {
        self.val = null;
    }
}