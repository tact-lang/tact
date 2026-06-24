struct Level3 {
    v: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepChain {
    chain: Level1;
    
    init() {
        self.chain = Level1{
            l2: Level2{
                l3: Level3{ v: 123 }
            }
        };
    }
}