struct Level1 {
    f1: Int?;
    f2: Bool?;
}

struct Level2 {
    l1: Level1?;
}

struct Level3 {
    l2: Level2?;
}

contract OptionalNest {
    val: Level3;
    
    init() {
        self.val = Level3{
            l2: Level2{
                l1: Level1{
                    f1: 7,
                    f2: true
                }
            }
        };
    }
}
