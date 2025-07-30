struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalNullableNested {
    data: OuterOpt;
    init() {
        self.data = OuterOpt {
            inner: InnerOpt{ a: null },
        };
    }
}