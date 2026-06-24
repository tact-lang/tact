struct Level3 {
    x: Int;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    z: Level2;
}

contract UltraNested {
    data: Level1;

    init() {
        self.data = Level1{
            z: Level2{
                y: Level3{ x:123 }
            }
        };
    }
}