struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract MoreNested {
    a: Level1;
    b: Level1;

    init() {
        self.a = Level1{ l2: Level2{ l3: Level3{ val: 10 } } };
        self.b = Level1{ l2: Level2{ l3: Level3{ val: 20 } } };
    }
}