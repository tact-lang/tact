const CVAL: Int = 31337;

struct InnerRef {
    val: Int = CVAL;
}

struct OuterRef {
    inner: InnerRef;
}

contract ConstDefaultRef {
    store: OuterRef;

    init() {
        self.store = OuterRef{
            inner: InnerRef{}
        };
    }
}