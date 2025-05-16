// deeply nested optionals in structs
struct Level3 {
    z: Int?;
}

struct Level2 {
    y: Level3?;
}

struct Level1 {
    x: Level2?;
}

contract TestContract {
    nest: Level1;

    init() {
        self.nest = Level1{
            x: Level2{
                y: Level3{
                    z: 5
                }
            }
        };
    }
}