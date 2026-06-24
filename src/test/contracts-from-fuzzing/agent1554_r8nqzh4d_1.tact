struct DeepNested {
    inner: Level1;
}

struct Level1 {
    sub: Level2;
}

struct Level2 {
    sub: Level3;
}

struct Level3 {
    sub: Level4;
}

struct Level4 {
    val: Int;
}

contract NestedStructTest {
    data: DeepNested = DeepNested{
        inner: Level1{
            sub: Level2{
                sub: Level3{
                    sub: Level4{
                        val: 123
                    }
                }
            }
        }
    };
}
