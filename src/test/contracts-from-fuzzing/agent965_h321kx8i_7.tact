struct Level3 {
    a: Int;
}

struct Level2 {
    b: Int;
    c: Level3;
}

struct Level1 {
    d: Int;
    e: Level2;
}

contract DeepTest {
    field: Level1;

    init() {
        self.field = Level1{
            d: 1,
            e: Level2{
                b: 2,
                c: Level3{
                    a: 3
                }
            }
        };
    }
}