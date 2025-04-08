struct Level4 {
    i: Int;
}

struct Level3 {
    next: Level4;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract FourLevels {
    data: Level1;
    init() {
        self.data = Level1{
            next: Level2{
                next: Level3{
                    next: Level4{ i: 123 }
                }
            }
        };
    }
}