struct Level3 {
    v: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract D {
    state: Level1;

    init() {
        self.state = Level1{ l2: Level2{ l3: Level3{ v: 123 } } };
    }
}