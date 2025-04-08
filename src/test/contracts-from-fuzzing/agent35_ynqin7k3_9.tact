struct Level3 {
    value: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepChain {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    value: 42
                }
            }
        };
    }
}