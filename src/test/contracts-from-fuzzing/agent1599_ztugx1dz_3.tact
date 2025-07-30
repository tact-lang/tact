struct InnerMost {
    v: Int?;
    b: Bool?;
}

struct Inner {
    im: InnerMost;
    s: String?;
}

contract DeepNest {
    field: Inner;

    init() {
        self.field = Inner{
            im: InnerMost{
                v: 10,
                b: true
            },
            s: "deep"
        };
    }
}