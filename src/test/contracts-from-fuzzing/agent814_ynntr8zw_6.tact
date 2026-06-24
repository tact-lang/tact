struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract TripleNested {
    field: Level1;

    init() {
        self.field = Level1{
            nested: Level2{
                nested: Level3{
                    val: 123
                }
            }
        };
    }
}