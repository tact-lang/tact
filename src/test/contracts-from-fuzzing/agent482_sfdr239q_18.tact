struct Level3 {
    z: Int?;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract OptionalChain {
    chain: Level1?;

    init() {
        self.chain = null;
    }
}
