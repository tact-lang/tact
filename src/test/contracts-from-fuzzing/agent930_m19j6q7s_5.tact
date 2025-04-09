struct Level3 {
    flag: Bool;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    flag: true
                }
            }
        };
    }
}