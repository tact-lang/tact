struct DeepOpt {
    d: Int?;
}

struct MidOpt {
    deep: DeepOpt?;
}

contract NestedOptionInner {
    mid: MidOpt?;

    init() {
        self.mid = null;
    }
}