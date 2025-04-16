struct Level3 {
    value: Int;
}

struct Level2 {
    third: Level3;
}

struct Level1 {
    second: Level2;
}

contract ThreeLevels {
    nested: Level1;

    init() {
        self.nested = Level1{
            second: Level2{
                third: Level3{
                    value: 123
                }
            }
        };
    }
}
