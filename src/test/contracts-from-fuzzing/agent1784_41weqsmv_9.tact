struct OptionalNest {
    nested: Level2?;
}

struct Level2 {
    nested: Level3?;
}

struct Level3 {
    value: Int?;
}

contract TestContract {
    data: OptionalNest;
    
    init() {
        self.data = OptionalNest{
            nested: Level2{
                nested: Level3{
                    value: null
                }
            }
        };
    }
}