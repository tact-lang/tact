struct DeeplyNested {
    v1: Int?;
    v2: String?;
}

struct Middle {
    nested: DeeplyNested;
}

contract NullsEverywhere {
    inner: Middle;

    init() {
        self.inner = Middle {
            nested: DeeplyNested {
                v1: null,
                v2: null
            }
        };
    }
}