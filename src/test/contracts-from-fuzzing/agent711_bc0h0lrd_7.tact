struct Level3 {
    f3a: Int;
    f3b: Int?;
}

struct Level2 {
    f2a: Level3;
    f2b: Int;
}

struct Level1 {
    f1a: Level2;
    f1b: Int;
}

contract DeepNestedStructs {
    value: Level1;

    init() {
        self.value = Level1{
            f1a: Level2{
                f2a: Level3{
                    f3a: 100,
                    f3b: null
                },
                f2b: 200
            },
            f1b: 300
        };
    }
}
