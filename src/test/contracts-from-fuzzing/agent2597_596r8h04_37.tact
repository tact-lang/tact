struct InnerMost {
    val: Int?;
}

struct MiddleOpt {
    nested: InnerMost?;
}

struct OuterOpt {
    m: MiddleOpt?;
}

contract DeepUnset {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            m: MiddleOpt{
                nested: InnerMost{
                    // intentionally omit 'val', should default to null
                },
            },
        };
    }
}