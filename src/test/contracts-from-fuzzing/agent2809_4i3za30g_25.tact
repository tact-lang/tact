struct OneFieldOpt {
    v: Int?;
}

struct NestedOpt {
    inner: OneFieldOpt?;
}

contract NestedOptionals {
    f: NestedOpt;

    init() {
        self.f = NestedOpt{ inner: null };
    }
}