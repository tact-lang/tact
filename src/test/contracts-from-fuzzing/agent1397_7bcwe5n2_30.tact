struct Inner {
    f: Int?;
    b: Bool;
}

contract TestContract {
    optInner: Inner? = null;

    receive() {
        if (self.optInner != null) {
            let v = self.optInner!!;
            let _ = v.f;
            let _ = v.b;
        }
    }
}