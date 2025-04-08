struct InnerMost {
    val: Int;
}

struct MidLevel {
    inner: InnerMost;
}

struct TopLevel {
    mid: MidLevel;
}

contract DeeplyNestedStorage {
    top: TopLevel;

    init() {
        self.top = TopLevel{
            mid: MidLevel{
                inner: InnerMost{
                    val: 123,
                }
            }
        };
    }
}
