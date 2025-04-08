struct Level3 {
    val3: Int?;
    str3: String;
}

struct Level2 {
    nested3: Level3;
    val2: Int;
}

struct Level1 {
    nested2: Level2;
    flag1: Bool;
}

contract DeepNest {
    store: Level1;

    init() {
        self.store = Level1{
            nested2: Level2{
                nested3: Level3{ val3: null, str3: "deep" },
                val2: 999
            },
            flag1: true
        };
    }
}