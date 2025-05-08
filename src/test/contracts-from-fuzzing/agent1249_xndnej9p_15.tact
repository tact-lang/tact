struct InnerLevel {
    a: Int;
}

struct MidLevel {
    inner: InnerLevel;
}

struct TopLevel {
    mid: MidLevel;
}

contract MultiLevelNested {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{
            mid: MidLevel{
                inner: InnerLevel{ a: 7 }
            }
        };
    }
}