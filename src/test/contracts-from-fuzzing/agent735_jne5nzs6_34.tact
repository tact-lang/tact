struct InnerMost {
    value: Int?;
}

struct Middle {
    inner: InnerMost?;
}

struct Top {
    nested: Middle?;
}

contract NullCascades {
    data: Top;

    init() {
        self.data = Top{
            nested: null,
        };
    }
}
