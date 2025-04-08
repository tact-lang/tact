struct StringNest {
    payload: String;
}

struct MiddleNest {
    s: StringNest;
}

struct TopNest {
    m: MiddleNest;
}

contract StringDeepNest {
    f: TopNest;
    init() {
        self.f = TopNest{ m: MiddleNest{ s: StringNest{ payload:"hello"}}};
    }
}