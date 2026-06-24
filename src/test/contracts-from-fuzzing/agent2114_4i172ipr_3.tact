struct Level3 {
    z: Int;
}

struct Level2 {
    y1: Level3;
    y2: Level3;
    y3: Level3;
}

struct Level1 {
    x1: Level2;
    x2: Level2;
}

contract DeeplyNestedManyFields {
    data: Level1;
    
    init() {
        self.data = Level1{
            x1: Level2{
                y1: Level3{z: 1},
                y2: Level3{z: 2},
                y3: Level3{z: 3}
            },
            x2: Level2{
                y1: Level3{z: 4},
                y2: Level3{z: 5},
                y3: Level3{z: 6}
            }
        };
    }
}
