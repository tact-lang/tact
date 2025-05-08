struct InnerMost {
    field: Int;
}

struct Middle {
    nested: InnerMost?;
}

struct Top {
    content: Middle;
}

contract OptionalDeep {
    storage: Top;

    init() {
        self.storage = Top {
            content: Middle {
                nested: null
            }
        };
    }
}