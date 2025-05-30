struct EmptyOpt {
    foo: Int?;
}

struct WrapOpt {
    inner: EmptyOpt?;
}

contract NestedNulls {
    w: WrapOpt;

    init() {
        self.w = WrapOpt{ inner: null };
    }
}