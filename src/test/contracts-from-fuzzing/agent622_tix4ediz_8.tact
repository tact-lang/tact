struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
    flag2: Bool;
}

struct Level1 {
    nested: Level2;
    flag1: Bool;
}

contract DeepChainTest {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{
                    val: 42
                },
                flag2: true
            },
            flag1: false
        };
    }
}