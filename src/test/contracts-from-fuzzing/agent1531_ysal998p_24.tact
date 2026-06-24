struct Deep {
    field: Inner;
}

struct Inner {
    nested: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract DeepStorage {
    d: Deep;

    init() {
        self.d = Deep{
            field: Inner{
                nested: InnerMost{value: 42}
            }
        };
    }
}
