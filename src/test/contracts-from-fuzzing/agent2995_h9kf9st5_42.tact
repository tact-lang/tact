struct DeepNested {
    val: Int;
}

struct MiddleNested {
    deep: DeepNested;
}

struct TopNested {
    middle: MiddleNested;
}

contract MultiNested {
    data: TopNested;

    init() {
        self.data = TopNested{
            middle: MiddleNested{
                deep: DeepNested{
                    val: 123
                }
            }
        };
    }
}