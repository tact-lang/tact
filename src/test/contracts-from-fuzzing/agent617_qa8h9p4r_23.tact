struct NestedStrOpt {
    a: String?;
}

struct WrapStrOpt {
    inner: NestedStrOpt;
}

contract StrOptWrap {
    data: WrapStrOpt;
    init() {
        self.data = WrapStrOpt{
            inner: NestedStrOpt{ a: null }
        };
    }
}