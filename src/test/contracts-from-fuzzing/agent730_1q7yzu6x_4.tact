struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Middle {
    inner: Inner;
    d: String;
}

contract DeepNest {
    mid: Middle;

    init() {
        self.mid = Middle{
            inner: Inner{ a:null, b: null, c: null },
            d: "deep"
        };
    }
}
