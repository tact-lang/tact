// optional inner struct with optional primitive field
struct OptInner {
    flag: Bool?;
}

contract DoubleOptionalTest {
    inner: OptInner?;

    init() {
        self.inner = OptInner{ flag: null };
    }
}