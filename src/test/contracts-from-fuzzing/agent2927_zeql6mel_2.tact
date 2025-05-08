struct Level3 {
    deepVal: Int;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    pair: Level2;
    count: Int;
}

contract DeepTest {
    field: Level1;

    init() {
        self.field = Level1{
            pair: Level2{
                nested: Level3{ deepVal: 42 },
                flag: false
            },
            count: 99
        };
    }
}