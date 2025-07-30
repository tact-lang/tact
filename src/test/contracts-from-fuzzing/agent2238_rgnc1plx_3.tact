struct Level3 {
    deep: Int;
}

struct Level2 {
    deeper: Level3;
}

struct Level1 {
    deepest: Level2;
}

contract TestContract {
    field: Level1;

    init() {
        self.field = Level1{
            deepest: Level2{
                deeper: Level3{
                    deep: 123
                }
            }
        };
    }
}
