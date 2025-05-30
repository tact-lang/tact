struct OptionalBoolInt {
    b: Bool?;
    i: Int?;
}

struct LevelTwo {
    lvl: OptionalBoolInt?;
}

contract OptionalsEmbedded {
    emb: LevelTwo;
    init() {
        self.emb = LevelTwo{
            lvl: null
        };
    }
}