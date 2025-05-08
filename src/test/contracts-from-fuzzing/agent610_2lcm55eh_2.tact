struct Level2 {
    val2: Int;
}

struct Level1 {
    val1: Int;
    nested: Level2;
}

contract NestedStructsTest {
    data: Level1;

    init() {
        self.data = Level1{
            val1: 10,
            nested: Level2{ val2: 20 }
        };
    }
}