struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
    opt_nested: Level3?;
}

struct Level1 {
    nested: Level2;
}

contract DeepChain {
    chain: Level1;

    init() {
        self.chain = Level1{
            nested: Level2{
                nested: Level3{ val: 123 },
                opt_nested: null
            }
        };
    }
}