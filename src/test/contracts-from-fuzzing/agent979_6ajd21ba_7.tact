struct Level3 {
    val1: Int;
    val2: Int?;
}

struct Level2 {
    nested3: Level3;
    opt3: Level3?;
}

struct Level1 {
    nested2: Level2;
    opt2: Level2?;
}

contract Deep {
    nested1: Level1;

    init() {
        self.nested1 = Level1{
            nested2: Level2{
                nested3: Level3{ val1: 1, val2: null },
                opt3: null,
            },
            opt2: null,
        };
    }
}