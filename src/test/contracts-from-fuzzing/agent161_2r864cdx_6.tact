struct DeeplyNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    level4: Level4;
}

struct Level4 {
    x: Int;
    y: Bool;
}

contract DeepChain {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{ level1: Level1{ level2: Level2{ level3: Level3{ level4: Level4{ x: 1, y: true } } } } };
    }

    receive() {
        self.val = DeeplyNested{ level1: Level1{ level2: Level2{ level3: Level3{ level4: Level4{ x: 2, y: false } } } } };
    }
}