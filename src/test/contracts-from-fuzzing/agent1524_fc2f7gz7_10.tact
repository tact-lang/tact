// test optional contract storage fields deeply nested inside multiple optionals
struct Level3 {
    deep: Int?;
}

struct Level2 {
    mid: Level3?;
}

struct Level1 {
    top: Level2?;
}

contract DeepOpt {
    data: Level1?;

    init() {
        self.data = Level1{
            top: Level2{
                mid: Level3{
                    deep: null
                }
            }
        };
    }
}