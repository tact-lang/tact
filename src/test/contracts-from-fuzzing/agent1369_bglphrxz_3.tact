struct Inner {
    val: Int = 0;
}

contract TestOptionalNested {
    optInner: Inner? = null;

    init() {
        self.optInner = Inner{val: 55};
    }
}