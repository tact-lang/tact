struct DeeplyNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    value: Int;
}

contract TestContract {
    data: DeeplyNested = DeeplyNested{
        level1: Level1{
            level2: Level2{
                level3: Level3{
                    value: 42
                }
            }
        }
    };
    
    receive() {
        let _ = self.data;
    }
}