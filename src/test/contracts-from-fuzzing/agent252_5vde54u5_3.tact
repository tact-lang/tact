struct DeepNested {
    a: Int;
    b: Bool;
}

struct MidNested {
    inner1: DeepNested;
    inner2: DeepNested;
}

struct TopLevel {
    mid1: MidNested;
    mid2: MidNested;
    flag: Bool?;
}

contract DeepStructTest {
    payload: TopLevel;

    init() {
        self.payload = TopLevel{
            mid1: MidNested{
                inner1: DeepNested{a: 1, b: true},
                inner2: DeepNested{a: 2, b: false},
            },
            mid2: MidNested{
                inner1: DeepNested{a: 3, b: true},
                inner2: DeepNested{a: 4, b: false},
            },
            flag: null,
        };
    }
}