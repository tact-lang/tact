struct Level3 {
    gamma: Int?;
}

struct Level2 {
    beta: Level3?;
}

struct Level1 {
    alpha: Level2?;
}

contract TestContract {
    nested_opt: Level1;
    init() {
        self.nested_opt = Level1{
            alpha: Level2{
                beta: Level3{
                    gamma: 42
                }
            }
        };
    }
}