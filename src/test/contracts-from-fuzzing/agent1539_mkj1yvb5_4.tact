struct Level3 {
    val3a: Int;
    val3b: Bool?;
}

struct Level2 {
    val2a: Int;
    level3: Level3;
}

struct Level1 {
    val1a: String;
    level2: Level2;
}

contract DeeplyNested {
    data: Level1;

    init() {
        self.data = Level1{
            val1a: "test",
            level2: Level2{
                val2a: 5,
                level3: Level3{ val3a: 7, val3b: true }
            }
        };
    }
}