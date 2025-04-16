struct OptInner {
    s: String?;
}

struct OptOuter {
    inner: OptInner?;
}

contract DoubleNullable {
    val: OptOuter?;

    init() {
        self.val = null;
    }
}
