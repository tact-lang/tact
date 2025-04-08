struct Level4 {
    deepVal: Int;
}

struct Level3 {
    nested: Level4;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Test6 {
    val: Level1;

    init() {
        self.val = Level1{
            nested: Level2{
                nested: Level3{
                    nested: Level4{deepVal: 999}
                }
            }
        };
    }
}