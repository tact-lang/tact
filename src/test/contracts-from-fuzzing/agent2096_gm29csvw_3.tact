struct DeepNested {
    inner1: Int;
    inner2: Bool;
    inner3: Int?;
}

struct MidNested {
    midVal: DeepNested;
    midOpt: Bool?;
}

struct TopLevel {
    topVal: MidNested;
    topBool: Bool;
}

contract DeepTest {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            topVal: MidNested{
                midVal: DeepNested{ inner1: 7, inner2: false, inner3: null },
                midOpt: null
            },
            topBool: true
        };
    }
}