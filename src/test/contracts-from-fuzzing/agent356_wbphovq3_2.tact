struct DeepNested {
    val1: Int;
    val2: Int?;
}

struct MidNested {
    mid: DeepNested;
    flag: Bool;
}

struct TopNested {
    top: MidNested;
    active: Bool;
}

contract DeepNestTest {
    data: TopNested;

    init() {
        self.data = TopNested{
            top: MidNested{
                mid: DeepNested{
                    val1: 1,
                    val2: null
                },
                flag: true
            },
            active: false
        };
    }
}