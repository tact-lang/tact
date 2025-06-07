struct Nested {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    level4: Level4;
}

struct Level4 {
    value: Int;
}

contract Test {
    deep: Nested;

    init() {
        self.deep = Nested{
            level2: Level2{
                level3: Level3{
                    level4: Level4{ value: 99 }
                }
            }
        };
    }
}