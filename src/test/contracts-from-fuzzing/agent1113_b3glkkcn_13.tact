struct Level3 {
    val: Int;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract DeepChain {
    chain: Level1;

    init() {
        self.chain = Level1{nested2: Level2{nested3: Level3{val: 99}}};
    }
}