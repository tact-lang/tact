struct Level3 {
    a: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract NestedLevels {
    l1: Level1;

    init() {
        self.l1 = Level1{ l2: Level2{ l3: Level3{ a: 99 } } };
    }
}
