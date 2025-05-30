struct OptionalStructWithDefaultInner {
    val: Int = 7;
}

contract OptionalOuter {
    s: OptionalStructWithDefaultInner? = null;

    init() {
        self.s = null;
    }
}