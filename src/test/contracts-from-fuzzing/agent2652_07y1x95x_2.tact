struct Level3 {
    z: Int;
}

struct Level2 {
    y: Bool;
    nested: Level3;
}

struct Level1 {
    x: Int;
    nested: Level2;
}

contract DeepNestedStructTest {
    field: Level1;

    init() {
        self.field = Level1{
            x: 10,
            nested: Level2{
                y: false,
                nested: Level3{ z: 42 }
            }
        };
    }
}