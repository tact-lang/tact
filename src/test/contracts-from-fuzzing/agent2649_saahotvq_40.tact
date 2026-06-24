struct OptOuter {
    in1: OptInner?;
}

struct OptInner {
    x: Int;
    y: Bool?;
}

contract NestedOptDefaults {
    s: OptOuter;

    init() {
        self.s = OptOuter{
            in1: null,
        };
    }
}