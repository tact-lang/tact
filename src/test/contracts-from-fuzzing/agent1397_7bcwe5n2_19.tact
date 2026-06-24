struct Deep {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    val: Int;
}

contract TestContract {
    deep: Deep;

    init() {
        self.deep = Deep{
            level1: Level1{
                level2: Level2{
                    level3: Level3{ val: 777 }
                }
            }
        };
    }

    receive() {
        let _ = self.deep.level1.level2.level3.val;
    }
}