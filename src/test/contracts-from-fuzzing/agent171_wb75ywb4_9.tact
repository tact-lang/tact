struct InnerMost {
    a: Int;
    b: String;
}

struct MidLevel {
    x: InnerMost;
    y: String;
}

struct Top {
    m: MidLevel;
    n: Int;
}

contract TestDeep {
    data: Top;
    init() {
        self.data = Top{
            m: MidLevel{ x: InnerMost{ a:1, b:"str" }, y:"mid" },
            n: 77
        };
    }
}