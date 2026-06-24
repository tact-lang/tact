struct DeepChain {
    lvl1: Level1?;
}

struct Level1 {
    lvl2: Level2?;
}

struct Level2 {
    lvl3: Int?;
}

contract NullableDeepChain {
    link: DeepChain;

    init() {
        self.link = DeepChain{ lvl1: null };
    }
}