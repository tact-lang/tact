struct ChainWithBool {
    level2: LevelTwo;
}

struct LevelTwo {
    flag: Bool;
}

contract ChainWithBoolTest {
    chain: ChainWithBool;

    init() {
        self.chain = ChainWithBool{
            level2: LevelTwo{
                flag: true,
            }
        };
    }
}