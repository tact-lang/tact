struct OptInner {
    v: Int?;
}

contract OptInnerTest {
    inner: OptInner;

    init() {
        self.inner = OptInner{ v: null };
    }
}