// minimal nested optional with string
struct Inner {
    s: String?;
}
contract Test {
    inner: Inner?;
    init() {
        self.inner = Inner{ s: null };
    }
}