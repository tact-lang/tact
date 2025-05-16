struct Level3 {
    deepVal: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract NestedLevelTest {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    deepVal: 999
                }
            }
        };
    }
}
