// Nested contract field is optional struct including bool
struct Inner {
    x: Int;
    flag: Bool;
}
contract Test {
    inner: Inner?;
    init() {
        self.inner = Inner{ x: 5, flag: true };
    }
}