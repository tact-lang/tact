struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    id: Int;
}

struct Root {
    nested: Level1;
    extra: Bool;
}

contract DeepNestedStructTest {
    storageField: Root;

    init() {
        self.storageField = Root{
            nested: Level1{
                nested: Level2{
                    nested: Level3{
                        value: 777
                    },
                    flag: false
                },
                id: 42
            },
            extra: true
        };
    }
}