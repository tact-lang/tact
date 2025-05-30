struct Level3 {
    a: Int;
}

struct Level2 {
    sub: Level3;
}

struct Level1 {
    sub: Level2;
}

contract DeepContract {
    root: Level1;

    init() {
        self.root = Level1{
            sub: Level2{
                sub: Level3{
                    a: 42
                }
            }
        };
    }
}
