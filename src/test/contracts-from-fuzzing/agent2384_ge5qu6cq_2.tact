struct Level3 {
    deep: Int;
}

struct Level2 {
    nested: Level3;
    flag2: Bool;
}

struct Level1 {
    nested: Level2;
    flag1: Bool;
}

contract DeepNestedTest {
    val: Level1;

    init() {
        self.val = Level1{
            nested: Level2{
                nested: Level3{deep: 42},
                flag2: true,
            },
            flag1: false,
        };
    }
}