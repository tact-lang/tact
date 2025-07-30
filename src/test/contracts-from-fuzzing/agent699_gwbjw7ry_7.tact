struct Level3 {
    val1: Int?;
    val2: Bool?;
}

struct Level2 {
    nested3: Level3;
    num: Int = 42;
}

struct Level1 {
    nested2: Level2;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested2: Level2{
                nested3: Level3{ val1: null, val2: true },
                num: 99
            }
        };
    }
}
