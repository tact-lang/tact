struct InnerMost {
    v: Int;
}

struct InnerOpt {
    inn: InnerMost?;
}

struct MiddleOpt {
    io: InnerOpt?;
}

contract OptionalDeepNest {
    field: MiddleOpt;

    init() {
        self.field = MiddleOpt{ io: null };
    }
}