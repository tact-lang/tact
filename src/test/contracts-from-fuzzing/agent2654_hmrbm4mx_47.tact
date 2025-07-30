struct InIn {
    b: Bool;
}

struct OutOut {
    i: Int;
    inner: InIn;
}

contract NestedFieldUpdate {
    val: OutOut;

    init() {
        self.val = OutOut{
            i:1,
            inner: InIn{b:false}
        };
        self.val.inner.b = true;
    }
}