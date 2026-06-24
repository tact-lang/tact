struct InnerBool {
    flag: Bool;
}

struct OuterOptionalInner {
    inner: InnerBool?;
}

contract TestOptInner {
    val: OuterOptionalInner;

    init() {
        self.val = OuterOptionalInner{ inner: null };
    }
}
