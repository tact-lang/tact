struct Level3 { val3: Int; }
struct Level2 { nested3: Level3; }
struct Level1 { nested2: Level2; }

contract MultiDepth {
    chain: Level1;

    init() {
        self.chain = Level1{ nested2: Level2{ nested3: Level3{ val3: 30 } } };
    }
}