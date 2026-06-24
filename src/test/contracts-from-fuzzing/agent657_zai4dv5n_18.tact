struct DeepOptional {
    nested: Level1?;
}

struct Level1 {
    nested: Level2?;
}

struct Level2 {
    nested: Level3?;
}

struct Level3 {
    val: Int;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            nested: Level1{
                nested: Level2{
                    nested: null
                }
            }
        };
    }
}