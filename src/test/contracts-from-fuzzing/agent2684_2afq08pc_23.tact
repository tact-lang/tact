struct InnerLevelOpt {
    a: Int?;
}

struct OuterOpt {
    inner: InnerLevelOpt?;
}

contract NestedOptFields {
    f: OuterOpt = OuterOpt { inner: null };

    init() {
        self.f = OuterOpt { inner: InnerLevelOpt{a: null} };
    }
}
