struct SDeep {
    s: SInner;
}

struct SInner {
    s: SInnerMost;
}

struct SInnerMost {
    val: Int;
}

contract TestContract {
    deep: SDeep;
    init() {
        self.deep = SDeep{s:SInner{s:SInnerMost{val:123}}};
    }
}