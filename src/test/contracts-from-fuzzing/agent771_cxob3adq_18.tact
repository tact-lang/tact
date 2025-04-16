struct Wrapped {
    val: Int;
}

contract OptionalWrap {
    inner: Wrapped? = null;

    init() {
        self.inner = Wrapped{ val: 99 };
    }
}