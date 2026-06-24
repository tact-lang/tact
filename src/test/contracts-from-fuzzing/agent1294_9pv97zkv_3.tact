struct Level3 {
    deep: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepNestedTest {
    store: Level1 = Level1{
        inner: Level2{
            nested: Level3{
                deep: 123
            }
        }
    };
    receive() {}
}