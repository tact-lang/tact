struct MultiLevel {
    s1: Level1;
}

struct Level1 {
    s2: Level2;
}

struct Level2 {
    s3: Level3;
}

struct Level3 {
    val: Int?;
}

contract Test6 {
    field: MultiLevel;
    init() {
        self.field = MultiLevel {
            s1: Level1 {
                s2: Level2 {
                    s3: Level3 { val: 100 }
                }
            }
        };
    }
}