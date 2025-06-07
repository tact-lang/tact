struct Level3 {
    deepVal: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract NestedTest {
    data: Level1;
    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{
                    deepVal: 123
                }
            }
        };
    }
}