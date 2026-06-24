struct Level3 {
    x: Int;
}

struct Level2 {
    y: Int;
    nested: Level3;
}

struct Level1 {
    z: Int;
    nested: Level2;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            z: 1,
            nested: Level2{
                y: 2,
                nested: Level3{ x: 3 }
            }
        };
    }
}