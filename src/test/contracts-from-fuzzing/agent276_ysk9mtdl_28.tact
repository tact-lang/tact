struct InnerD {
    a: Int;
}

struct MiddleD {
    d: InnerD;
}

struct TopD {
    m: MiddleD;
    s: String;
}

contract DeeplyOptioned {
    p: TopD?;

    init() {
        self.p = null;
    }
}
