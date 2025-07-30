struct Inner {
    foo: Int;
}

struct WithOptionalInner {
    inner: Inner?;
}

contract OptNestedInside {
    data: WithOptionalInner;

    init() {
        self.data = WithOptionalInner{ inner: null };
    }
}
