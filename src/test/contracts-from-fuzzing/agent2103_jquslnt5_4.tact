struct Level3 {
    deepest: String?;
}

struct Level2 {
    optLev3: Level3?;
}

struct Level1 {
    optLev2: Level2?;
}

contract DeepOptionalChain {
    deepField: Level1?;

    init() {
        self.deepField = null;
    }
}
