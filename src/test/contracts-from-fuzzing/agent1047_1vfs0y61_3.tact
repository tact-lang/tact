struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    val: Level1;

    init() {
        self.val = Level1{
            nested: Level2{
                nested: Level3{
                    value: 99
                }
            }
        };
    }
}