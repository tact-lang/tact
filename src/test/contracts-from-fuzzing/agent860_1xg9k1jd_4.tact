struct Level3 {
    value: Int?;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepOptional {
    st: Level1;
    init() {
        self.st = Level1{ l2: Level2{ l3: Level3{ value: null } } };
    }
}