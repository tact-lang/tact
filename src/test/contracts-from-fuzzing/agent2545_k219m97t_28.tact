struct Level3 {
    data: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepThreeStructs {
    s: Level1;

    init() {
        self.s = Level1{
            inner: Level2{
                inner: Level3{
                    data: 777
                }
            }
        };
    }
}
