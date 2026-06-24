struct Level3 {
    n: Int;
}

struct Level2 {
    inner3: Level3;
}

struct Level1 {
    inner2: Level2;
}

contract MultiLevelConstruct {
    data: Level1;

    init() {
        self.data = Level1{
            inner2: Level2{
                inner3: Level3{
                    n: -42
                }
            }
        };
    }
}