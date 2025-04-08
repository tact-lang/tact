struct Level1 {
    x: Int?;
}

struct Level2 {
    y: Level1?;
}

struct Level3 {
    z: Level2?;
}

contract TestContract {
    data: Level3;

    init() {
        self.data = Level3{
            z: Level2{
                y: Level1{
                    x: 123
                }
            }
        };
    }
}