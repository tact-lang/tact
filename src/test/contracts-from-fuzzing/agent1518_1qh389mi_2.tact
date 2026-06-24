struct Level3 {
    deepValue: Int;
}

struct Level2 {
    nested: Level3;
    flag: Bool?;
}

struct Level1 {
    inner: Level2;
}

contract DeepNest {
    field: Level1;

    init() {
        self.field = Level1 {
            inner: Level2 {
                nested: Level3 { deepValue: 123 },
                flag: true
            }
        };
    }
}