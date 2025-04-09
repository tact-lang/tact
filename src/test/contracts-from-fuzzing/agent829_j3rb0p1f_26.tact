struct InnerMost {
    x: Int?;
    y: Bool;
}

struct Middle {
    nested: InnerMost;
}

struct OuterMost {
    wrap: Middle;
}

contract MultiNestedOpt {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            wrap: Middle{
                nested: InnerMost{
                    x: null,
                    y: true,
                }
            }
        };
    }
}