struct Level3 {
    val3: String;
}

struct Level2 {
    level3: Level3;
    opt3: Bool?;
}

struct Level1 {
    level2: Level2;
    opt2: Int?;
}

contract DeepNestTest {
    data: Level1;

    init() {
        self.data = Level1{
            level2: Level2{ level3: Level3{ val3: "deep" }, opt3: true },
            opt2: null
        };
    }
}