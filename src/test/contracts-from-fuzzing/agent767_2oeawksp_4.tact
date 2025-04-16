struct Level3 {
    field3a: Int;
    field3b: Bool?;
}

struct Level2 {
    field2: Level3;
}

struct Level1 {
    f1: Int?;
    f2: Level2;
    f3: Bool;
}

contract MixLevels {
    data: Level1;

    init() {
        self.data = Level1{
            f1: null,
            f2: Level2{
                field2: Level3{
                    field3a: 5,
                    field3b: true
                }
            },
            f3: false
        };
    }
}