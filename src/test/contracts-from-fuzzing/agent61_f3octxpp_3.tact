struct Level2 {
    c: Int;
}

struct Level1 {
    b: Level2;
}

struct Level0 {
    a: Level1;
}

contract DeepNestedTest {
    field: Level0;

    init() {
        self.field = Level0{
            a: Level1{
                b: Level2{
                    c: 123
                }
            }
        };
    }
}