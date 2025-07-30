struct OptInner {
    val: Int;
}

struct OptOuter {
    nested: OptInner?;
    flag: Bool;
}

contract DeepOptPersist {
    top: OptOuter? = null;
    init() {
        self.top = OptOuter{
            nested: OptInner{ val: 42 },
            flag: true,
        };
    }
}
