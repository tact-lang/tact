struct Level3 {
    l3: Int;
}

struct Level2 {
    l2: Level3;
}

struct Level1 {
    l1: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{ l1: Level2{ l2: Level3{ l3: 123 } } };
    }

    receive() {
        self.nested = self.nested;
    }
}
