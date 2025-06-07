struct HasOptionalInt {
    v: Int?;
}

struct HasOptionalInner {
    inner: HasOptionalInt?;
}

contract NestedOptionalReference {
    s: HasOptionalInner;
    init() {
        self.s = HasOptionalInner{ inner: null };
    }
}