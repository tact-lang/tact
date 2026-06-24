contract MultiNestedWithOptionals {
    top: Top;

    init() {
        self.top = Top{
            l1: Level1{
                v1: 1,
                l2: Level2{
                    v2: null,
                    l3: Level3{ v3: "hi" }
                }
            }
        };
    }
}

struct Top {
    l1: Level1;
}

struct Level1 {
    v1: Int;
    l2: Level2;
}

struct Level2 {
    v2: Int?;
    l3: Level3;
}

struct Level3 {
    v3: String;
}