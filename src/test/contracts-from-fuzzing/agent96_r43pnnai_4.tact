struct Level3 {
    x: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    mid: Level2;
}

contract DeepNestedStructTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            mid: Level2{
                inner: Level3{ x: 5 }
            }
        };
    }
}