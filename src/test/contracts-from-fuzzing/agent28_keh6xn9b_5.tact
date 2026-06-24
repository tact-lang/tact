struct Level5 {
    val: Int
}

struct Level4 {
    level5: Level5
}

struct Level3 {
    level4: Level4
}

struct Level2 {
    level3: Level3
}

struct Level1 {
    level2: Level2
}

contract Test {
    receive() {
        let nested: Level1 = Level1{
            level2: Level2{
                level3: Level3{
                    level4: Level4{
                        level5: Level5{ val: 42 }
                    }
                }
            }
        };
        return;
    }
}
