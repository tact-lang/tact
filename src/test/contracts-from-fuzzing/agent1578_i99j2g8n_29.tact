struct Level3 {
    x: Int;
}

struct Level2 {
    lev3: Level3?;
}

struct Level1 {
    lev2: Level2?;
}

contract DeepOptChain {
    nested: Level1?;

    init() {
        self.nested = null;
    }
}