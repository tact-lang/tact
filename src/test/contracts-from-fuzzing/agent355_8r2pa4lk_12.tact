struct DeeplyNested {
    x: Level1;
}

struct Level1 {
    y: Level2;
}

struct Level2 {
    z: Level3;
}

struct Level3 {
    alpha: Int;
    beta: Bool;
}

contract ComplexNest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            x: Level1{
                y: Level2{
                    z: Level3{ alpha: 123, beta: true }
                }
            }
        };
    }
}