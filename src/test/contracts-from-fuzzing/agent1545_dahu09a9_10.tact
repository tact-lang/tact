struct Level3 {
    f3: Int;
}

struct Level2 {
    f2: Level3;
}

struct Level1 {
    f1: Level2;
}

contract DeepThree {
    val: Level1;

    init() {
        self.val = Level1{ f1: Level2{ f2: Level3{ f3: 999 } } };
    }
}
