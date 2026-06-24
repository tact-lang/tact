struct OptionInner {
    val: Int?;
}

struct OptionMid {
    inner: OptionInner?;
}

contract NullDeep {
    data: OptionMid;
    init() {
        self.data = OptionMid{ inner: null };
    }
}