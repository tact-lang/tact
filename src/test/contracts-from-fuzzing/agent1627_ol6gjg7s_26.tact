struct InnerMost {
    val1: Int;
    val2: String?;
}

struct MiddleNested {
    inner: InnerMost;
    flag: Bool;
}

struct OuterNested {
    mid: MiddleNested;
    another: Int;
}

contract DeeplyNestedStructs {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            mid: MiddleNested{
                inner: InnerMost{
                    val1: 777,
                    val2: null
                },
                flag: false
            },
            another: 888
        };
    }
}
