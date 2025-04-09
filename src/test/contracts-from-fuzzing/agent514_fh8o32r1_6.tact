struct Level3 {
    e: Int;
}

struct Level2 {
    d: Level3;
}

struct Level1 {
    c: Level2;
}

contract DeepNullsTest {
    data: Level1;
    init() {
        self.data = Level1{
            c: Level2{
                d: Level3{
                    e: 7
                }
            }
        };
    }
}