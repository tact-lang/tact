struct NestedManyLevels {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Int;
}

contract DeepLevelsTest {
    data: NestedManyLevels;

    init() {
        self.data = NestedManyLevels{
            a: Level1{
                b: Level2{
                    c: Level3{
                        d: 123,
                    },
                },
            },
        };
    }
}
