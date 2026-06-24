struct Level3 {
    deep1: String;
    deep2: Int;
}

struct Level2 {
    mid1: Level3;
    mid2: Bool;
    mid3: String;
}

struct Level1 {
    top1: Level2;
    top2: Int?;
}

contract ManyLevels {
    root: Level1;

    init() {
        self.root = Level1{
            top1: Level2{
                mid1: Level3{
                    deep1: "deep",
                    deep2: 77
                },
                mid2: true,
                mid3: "mid"
            },
            top2: 42
        };
    }
}