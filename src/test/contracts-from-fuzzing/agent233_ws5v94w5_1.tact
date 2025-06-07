struct DeepNested {
    f1: Int;
    f2: Int?;
}

struct MiddleNested {
    inner: DeepNested;
    optInner: DeepNested?;
}

struct TopLevel {
    nested: MiddleNested;
    optNested: MiddleNested?;
    flag: Bool;
}

contract NestTest {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            nested: MiddleNested{
                inner: DeepNested{f1:1,f2:2},
                optInner: null
            },
            optNested: null,
            flag: true
        };
    }
}
