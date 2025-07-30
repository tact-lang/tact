struct Levels3 {
    l1: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    value: Int;
}

contract Chain3 {
    val: Levels3;
    init() {
        self.val = Levels3{ l1: Level1{ l2: Level2{ value: 123 } } };
    }
}