struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner1: InnerOpt;
    inner2: InnerOpt;
    c: String?;
}

contract OptLayers {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inner1: InnerOpt{ a: 1, b: null },
            inner2: InnerOpt{ a: null, b: true },
            c: null
        };
    }
}