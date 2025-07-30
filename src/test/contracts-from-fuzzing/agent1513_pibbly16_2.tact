struct Level3 {
    z: String;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract Deep {
    val: Level1;

    init() {
        self.val = Level1{
            x: Level2{
                y: Level3{
                    z: "deep"
                }
            }
        };
    }
}