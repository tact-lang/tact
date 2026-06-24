struct Level3 {
    item: Int;
}

struct Level2 {
    sub: Level3;
}

struct Level1 {
    inner: Level2;
}

contract MultiNestTest {
    complex: Level1;
    init() {
        self.complex = Level1{
            inner: Level2{
                sub: Level3{
                    item: -123
                }
            }
        };
    }
}