struct Level3 {
    x: Int;
    y: Int?;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNestedTest {
    lv1: Level1;

    init() {
        self.lv1 = Level1{
            l2: Level2{
                l3: Level3{
                    x: 7,
                    y: null,
                }
            }
        };
    }
}