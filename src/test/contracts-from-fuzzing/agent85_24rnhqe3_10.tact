struct Level3 {
    a: Int;
}

struct Level2 {
    level3: Level3;
}

struct Level1 {
    level2: Level2;
}

contract Test {
    deep: Level1;
    init() {
        self.deep = Level1{
            level2: Level2{
                level3: Level3{
                    a: 42
                }
            }
        };
    }
}