struct EmptyOpt {
    a: Int?;
}

struct WrapOpt {
    inner: EmptyOpt?;
}

contract NullableWrapper {
    w: WrapOpt;
    init() {
        self.w = WrapOpt{ inner: null };
    }
}