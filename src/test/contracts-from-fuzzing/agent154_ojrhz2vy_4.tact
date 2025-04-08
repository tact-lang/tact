struct OptionalInner { inner: Int; }

struct OptionalOuter { innerOpt: OptionalInner?; }

contract OptionalNestedOpt {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{ innerOpt: null };
    }
}