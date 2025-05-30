struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int?;
    sub: Level3;
}

struct Level1 {
    x: Level2?;
}

contract NestedOptionals {
    top: Level1;

    init() {
        self.top = Level1{
            x: Level2{
                y: null,
                sub: Level3{z: 42}
            }
        };
    }
}