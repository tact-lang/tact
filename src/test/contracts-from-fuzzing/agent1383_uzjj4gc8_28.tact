struct InnerMost {
    v: Int;
}

struct InnerOpt {
    inner: InnerMost?;
}

struct OuterOpt {
    middle: InnerOpt?;
}

contract MultiLevelOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ middle: null };
    }
}