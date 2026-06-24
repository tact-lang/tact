struct Level3 {
    z: Int;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    middle: Level2;
}

contract Test {
    root: Level1;

    init() {
        self.root = Level1{
            middle: Level2{
                inner: Level3{ z: 123 }
            }
        };
    }
}