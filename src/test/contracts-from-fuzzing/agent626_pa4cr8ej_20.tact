struct OptionalInnerWithDefaults {
    a: Int?;
    b: String?;
}

struct HasOptInner {
    inner: OptionalInnerWithDefaults?;
}

contract OuterOptDefaults {
    s: HasOptInner;

    init() {
        self.s = HasOptInner{ inner: OptionalInnerWithDefaults{ a: null, b: "yo" } };
    }
}