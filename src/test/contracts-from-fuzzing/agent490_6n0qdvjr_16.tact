struct OptInner {
    i: Int;
}

struct HoldsOpt {
    inner: OptInner?;
}

contract NestedOpt {
    val: HoldsOpt;
    init() {
        self.val = HoldsOpt{ inner: null };
    }
}