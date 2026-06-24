struct OptionalNested {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    val: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            level1: Level1{
                level2: Level2{
                    val: 777
                }
            }
        };
    }
}
