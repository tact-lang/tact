struct Level3 {
    deep: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    mid: Level2;
}

contract DeeplyNestedChain {
    top: Level1;

    init() {
        self.top = Level1{
            mid: Level2{
                inner: Level3{
                    deep: 123
                }
            }
        };
    }
}