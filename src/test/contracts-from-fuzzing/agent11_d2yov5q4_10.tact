struct Leaf {
    leafVal: Int;
}

struct MidOpt {
    leaf: Leaf?;
    x: Int;
}

struct Top {
    m: MidOpt;
    y: Int;
}

contract OptLeafContract {
    f: Top;

    init() {
        self.f = Top{
            m: MidOpt{
                leaf: null,
                x: 44,
            },
            y: 88,
        };
    }
}