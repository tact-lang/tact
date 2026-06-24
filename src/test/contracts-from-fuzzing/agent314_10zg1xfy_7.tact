struct Level3 {
    flag: Bool;
}

struct Level2 {
    level3: Level3;
    optionalInt: Int?;
}

struct Level1 {
    level2: Level2;
    someString: String;
}

contract MultiLevelStructStorage {
    field: Level1;
    init() {
        self.field = Level1{
            level2: Level2{
                level3: Level3{
                    flag: false
                },
                optionalInt: null
            },
            someString: "nested"
        };
    }
}