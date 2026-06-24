struct Level3 {
    deepVal: Int;
}

struct Level2 {
    level3: Level3;
    flag: Bool;
}

struct Level1 {
    level2: Level2;
    note: String;
}

contract DeepNest {
    root: Level1;

    init() {
        self.root = Level1{
            level2: Level2{
                level3: Level3{deepVal: 100},
                flag: true
            },
            note: "test"
        };
    }
}