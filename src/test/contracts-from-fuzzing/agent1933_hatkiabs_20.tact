struct InnerMost {
    x: Int;
    y: Bool?;
}

struct MiddleNest {
    inner: InnerMost;
    msg: String;
}

struct OuterNest {
    mid: MiddleNest?;
}

contract NullDeepStart {
    data: OuterNest;

    init() {
        self.data = OuterNest{
            mid: null
        };
    }
}