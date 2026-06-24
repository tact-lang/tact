struct StrNest {
    s1: StrInner;
}

struct StrInner {
    s2: StrInnerInner;
}

struct StrInnerInner {
    s: String;
    optStr: String?;
}

contract StringDeepNest {
    data: StrNest;
    init() {
        self.data = StrNest{
            s1: StrInner{
                s2: StrInnerInner{
                    s: "hello",
                    optStr: null,
                },
            },
        };
    }
}