struct MultiLevelsOptional {
    inner1: Int?;
    inner2: String?;
}

struct OuterOpt {
    maybe: MultiLevelsOptional?;
    x: Int;
}

contract OptLevelTest {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            maybe: null,
            x: 11
        };
    }
}
