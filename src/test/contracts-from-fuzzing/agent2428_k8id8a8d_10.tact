struct Level3 {
    a: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            nested: Level2{
                nested: Level3{
                    a: 77
                }
            }
        };
    }
}