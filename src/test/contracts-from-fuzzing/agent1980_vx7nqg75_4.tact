struct Level3 {
    val3a: Int;
    val3b: String?;
}

struct Level2 {
    nested3: Level3;
    flag2: Bool;
}

struct Level1 {
    nested2: Level2;
    value1: Int?;
}

contract MultiNested {
    root: Level1;

    init() {
        self.root = Level1{
            nested2: Level2{
                nested3: Level3{ val3a: 123, val3b: null },
                flag2: true
            },
            value1: null
        };
    }
}