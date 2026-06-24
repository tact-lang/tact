struct Level1 {
    val1: Int;
    sub: Level2;
}

struct Level2 {
    val2: Int;
    sub2: Level3;
}

struct Level3 {
    val3: Int;
    flag: Bool;
}

contract MultiLevelNested {
    val: Level1;

    init() {
        self.val = Level1{
            val1: 1,
            sub: Level2{
                val2: 2,
                sub2: Level3{ val3: 3, flag: false }
            }
        };
    }
}