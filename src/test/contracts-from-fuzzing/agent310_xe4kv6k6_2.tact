struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    deeper: Level2;
}

contract DeepNestedStructTest {
    s: Level1;

    init() {
        self.s = Level1{
            deeper: Level2{
                inner: Level3{
                    val: 42
                }
            }
        };
    }
}