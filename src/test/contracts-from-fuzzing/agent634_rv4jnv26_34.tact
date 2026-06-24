// Nested struct chain, some fields as optional without defaults
struct Level3 {
    x: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract ChainOptNoDef {
    chain: Level1;
    init() {
        self.chain = Level1{l2: null};
    }
}