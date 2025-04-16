struct InnerMost { val: Int; }

struct InnerOpt {
    nest: InnerMost?;
}

struct Top {
    n: InnerOpt;
}

contract OptionalInnerMostContract {
    data: Top;

    init() {
        self.data = Top { n: InnerOpt { nest: null } };
    }
}