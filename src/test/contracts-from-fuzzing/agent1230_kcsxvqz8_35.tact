struct Inner {
    x: Int;
    y: Int;
    z: Int;
}

struct WrapOptInner {
    inner: Inner?;
}

contract OptionalNestedInner {
    f: WrapOptInner;

    init() {
        self.f = WrapOptInner{ inner: null };
    }
}