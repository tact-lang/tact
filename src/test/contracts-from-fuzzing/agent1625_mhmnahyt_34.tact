struct OuterOptInner {
    inner: InnerOpt;
}

struct InnerOpt {
    val: Int?;
}

contract OptStructWithNull {
    s: OuterOptInner;

    init() {
        self.s = OuterOptInner{
            inner: InnerOpt{
                val: null,
            }
        };
    }
}
