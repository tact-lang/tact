struct SInner {
    p: Bool?;
}

struct SOuter {
    inner: SInner;
}

contract NestedDeepOpt {
    s: SOuter;

    init() {
        self.s = SOuter{inner: SInner{p: null}};
    }
}
