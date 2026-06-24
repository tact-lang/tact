struct Level3 {
    x: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract NestedStructs {
    s: Level1;

    init() {
        self.s = Level1{
            nested: Level2{
                nested: Level3{
                    x: 42
                }
            }
        };
    }
}
