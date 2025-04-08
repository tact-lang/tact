struct Level3 {
    a: Bool;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{ l2: Level2{ l3: Level3{ a: true } } };
    }
}