struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
    maybeInt: Int?;
}

struct Top {
    m: Middle;
    flag: Bool;
}

contract DeeplyNested {
    data: Top;

    init() {
        self.data = Top{
            m: Middle{
                inner: InnerMost{ value: -5 },
                maybeInt: null
            },
            flag: true
        };
    }
}