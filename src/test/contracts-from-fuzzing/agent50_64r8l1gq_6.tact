struct EmptyNested {
    val: Int;
}

struct MidNested {
    nested: EmptyNested;
}

struct TopNested {
    middle: MidNested;
}

contract MultiLevelNested {
    data: TopNested;

    init() {
        self.data = TopNested{
            middle: MidNested{
                nested: EmptyNested{ val: 555}
            }
        };
    }
}