// Struct with nested optional, optional struct, inside persistent storage
struct Level3 {
    x: Int;
}

struct Level2 {
    innerOpt: Level3?;
}

struct Level1 {
    nestedOpt: Level2?;
}

contract TestContract {
    data: Level1?;

    init() {
        self.data = Level1{
            nestedOpt: Level2{
                innerOpt: Level3{
                    x: 123456
                }
            }
        };
    }
}