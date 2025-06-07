struct InnerOpt {
    foo: Int?;
}

struct WrapOpt {
    inner: InnerOpt?;
}

contract NullableInner {
    field: WrapOpt;

    init() {
        self.field = WrapOpt{ inner: null };
    }
}