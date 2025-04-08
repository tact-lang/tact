struct Level1 {
    p: Int;
}

struct Level2 {
    p: Level1;
}

struct Level3 {
    p: Level2;
}

contract DeepData {
    d: Level3;

    init() {
        self.d = Level3{
            p: Level2{
                p: Level1{
                    p: 42
                }
            }
        };
    }
}