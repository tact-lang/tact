struct NestedBool {
    flag: Bool;
}

struct HasOptInner {
    inner: NestedBool?;
}

contract OptionalInnerBool {
    data: HasOptInner;

    init() {
        self.data = HasOptInner{ inner: null };
    }
}