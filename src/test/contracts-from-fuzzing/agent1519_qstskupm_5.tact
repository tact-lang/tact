struct Level3 {
    val: Int = 7;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepNestTest {
    root: Level1 = Level1{
        inner: Level2{
            inner: Level3{val: 10}
        }
    };

    init() {
        self.root = Level1{
            inner: Level2{ inner: Level3{val: 20} }
        };
    }
}