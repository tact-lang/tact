struct Level2 {
    a: Int;
}

struct Level1 {
    nested: Level2;
}

contract TwoLevels {
    val: Level1;

    init() {
        self.val = Level1{
            nested: Level2{ a: 42 }
        };
    }
}
