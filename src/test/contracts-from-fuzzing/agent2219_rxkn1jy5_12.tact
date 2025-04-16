struct NestedOpt {
    x: Int?;
}

struct Wrapper {
    inner: NestedOpt;
}

contract WrappedOpt {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: NestedOpt{ x: null } };
    }
}