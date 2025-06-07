struct InnerMost {
    v: Int;
}

struct Mid {
    im: InnerMost;
}

struct Top {
    m: Mid;
}

contract DeepDeepNested {
    field: Top;
    init() {
        self.field = Top{
            m: Mid{
                im: InnerMost{
                    v: 99
                }
            }
        };
    }
}