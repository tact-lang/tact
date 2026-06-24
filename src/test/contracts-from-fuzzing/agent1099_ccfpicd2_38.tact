struct Inner {
    val: Int;
}

contract OptionalStructWithDefault {
    s: Inner? = null;

    init() {
        self.s = Inner{val:42};
    }
}