struct InnerMost {
    text: String?;
}

struct Mid {
    inner: InnerMost?;
}

struct OuterMost {
    mid: Mid?;
}

contract MultiOptLevels {
    field: OuterMost;

    init() {
        self.field = OuterMost{
            mid: Mid{
                inner: null,
            },
        };
    }
}