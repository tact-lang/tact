struct Level3 {
    val3: Int;
}

struct Level2 {
    level3: Level3;
    val2: Bool;
}

struct Level1 {
    level2: Level2;
    val1: Address;
}

contract DeepChain {
    chain: Level1;

    init() {
        self.chain = Level1{
            level2: Level2{
                level3: Level3{ val3: 999 },
                val2: true
            },
            val1: myAddress()
        };
    }
}