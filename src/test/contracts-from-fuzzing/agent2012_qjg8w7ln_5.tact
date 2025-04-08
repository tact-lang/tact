struct Level3 {
    val: Int;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract DeepChain {
    chain: Level1;

    init() {
        self.chain = Level1{ next: Level2{ next: Level3{ val: 42 } } };
    }
}