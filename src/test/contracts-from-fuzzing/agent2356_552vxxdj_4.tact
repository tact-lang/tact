struct Level3 {
    deepField: Int;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract NestedChainStorage {
    chain: Level1;

    init() {
        self.chain = Level1{ next: Level2{ next: Level3{ deepField: 42 } } };
    }
}