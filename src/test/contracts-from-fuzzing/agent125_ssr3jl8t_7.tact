struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract OneNestedStruct {
    persisted: Level1;
    init() {
        self.persisted = Level1{
            x: Level2{
                y: Level3{
                    z: 99
                }
            }
        };
    }
}