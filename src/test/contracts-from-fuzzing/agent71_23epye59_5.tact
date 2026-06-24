struct Level3 {
    x: Int;
}

struct Level2 {
    level3: Level3;
    y: Int;
}

struct Level1 {
    level2: Level2;
    z: Int;
}

contract DeepNestedStructTest {
    field: Level1;

    init() {
        self.field = Level1{
            level2: Level2{
                level3: Level3{ x: 1 },
                y: 2
            },
            z: 3
        };
    }
}