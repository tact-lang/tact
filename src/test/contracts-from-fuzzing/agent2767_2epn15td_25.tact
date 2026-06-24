// Optional String field inside nested struct without default
struct Inner {
    s: String?;
}

contract OptStringTest {
    inner: Inner;

    init() {
        self.inner = Inner{ s: null };
    }
}