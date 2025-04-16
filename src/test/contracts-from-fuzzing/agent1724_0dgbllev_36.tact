struct Bottom {
    v: Int;
}

struct MidOpt {
    mid: Bottom?;
}

struct Top {
    up: MidOpt?;
}

contract NullTopOpt {
    top: Top?;
    init() {
        self.top = null;
    }
}