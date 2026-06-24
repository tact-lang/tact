// Persistent state with heavily nested optionals and mix of defaults

struct InnerMost {
    x: Int?;
    y: Bool?;
}

struct MidInner {
    inner: InnerMost = InnerMost{};
    label: String?;
}

struct TopMost {
    nested: MidInner?;
    active: Bool = false;
}

contract NestedOptDefaults {
    data: TopMost;

    init() {
        self.data = TopMost{
            nested: null
        };
    }
}