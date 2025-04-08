struct Level3 {
    x: Int = 1;
    y: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{ l2: Level2{ l3: null } };
    }
}