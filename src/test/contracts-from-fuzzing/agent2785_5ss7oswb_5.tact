struct Nested {
    inner: Inner;
    optInner: Inner?;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract Test(
    n: Nested,
) {
    receive() {
        let innerOpt = self.n.optInner;
        let _y = (innerOpt != null) ? innerOpt!!.y : null;
        let _ = self.n.inner.x + (_y != null ? _y!! : 0);
    }
}
