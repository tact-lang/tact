struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
    opt: Int?;
}

struct Level1 {
    nested2: Level2;
}

contract Test {
    field: Level1;

    init() {
        self.field = Level1{
            nested2: Level2{
                nested: Level3{ val: 999 },
                opt: 50
            }
        };
    }
}