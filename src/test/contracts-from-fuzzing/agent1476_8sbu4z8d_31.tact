struct DeepInner {
    val: Int;
}

struct MidInner {
    d: DeepInner?;
}

contract NestedOptionalsTop {
    opt: MidInner?;

    init() {
        self.opt = null;
    }
}