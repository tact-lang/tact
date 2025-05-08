struct InnerMost {
    id: Int;
}

struct InnerMid {
    opt: InnerMost?;
}

struct Mid {
    mandatory: InnerMid;
}

contract OptDeepMandatory {
    storage: Mid;

    init() {
        self.storage = Mid {
            mandatory: InnerMid { opt: InnerMost { id: 321 } }
        };
    }
}