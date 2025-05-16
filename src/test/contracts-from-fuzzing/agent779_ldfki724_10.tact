struct Level3 {
    val3: Int;
}

struct Level2 {
    val2: Int?;
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract DeepChain {
    chain: Level1;

    init() {
        self.chain = Level1{
            next: Level2{
                val2: null,
                next: Level3{ val3: 999 }
            }
        };
    }
}