struct DeepNested {
    d1: Int;
    d2: Int;
}

struct Middle {
    deep: DeepNested;
}

struct Top {
    mid: Middle;
}

contract DeepNestContract {
    content: Top;

    init() {
        self.content = Top{
            mid: Middle{
                deep: DeepNested{
                    d1: 1,
                    d2: 2,
                },
            }
        };
    }
}