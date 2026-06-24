struct Level1 {
    f1: Int;
    f2: Level2;
}

struct Level2 {
    f3: Int?;
    f4: Level3;
}

struct Level3 {
    f5: Bool?;
    f6: String;
}

contract DeepTree {
    data: Level1;
    init() {
        self.data = Level1{
            f1: 42,
            f2: Level2{
                f3: null,
                f4: Level3{
                    f5: null,
                    f6: "deep"
                }
            }
        };
    }
}