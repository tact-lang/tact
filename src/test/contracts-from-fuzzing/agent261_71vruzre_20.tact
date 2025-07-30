struct SInner { a: Int; b: Bool }

contract OptionalStructField {
    maybe: SInner?;

    init() {
        self.maybe = null;
    }

    receive() {
        if (self.maybe != null) {
            let _ = self.maybe!!.a;
        }
    }
}