struct OptionalDeep {
    level1: Int?;
    level2: LevelTwo?;
}

struct LevelTwo {
    value: Int;
    text: String?;
}

contract OptionalDeepStructTest {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            level1: null,
            level2: LevelTwo{
                value: 99,
                text: null,
            },
        };
    }
}