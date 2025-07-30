struct Level3 {
    val: Int?;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    l1: Level1;

    init() {
        self.l1 = Level1 { nested: Level2 { nested: Level3 { val: null } } };
    }
}