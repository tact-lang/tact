struct Level3 {
    note: String?;
    flag: Bool?;
}

struct Level2 {
    id: Int?;
    innerMost: Level3?;
}

struct Level1 {
    name: String;
    nested: Level2?;
}

contract DeeplyNestedOptionals {
    data: Level1;

    init() {
        self.data = Level1{
            name: "DeepTest",
            nested: Level2{
                id: null,
                innerMost: Level3{
                    note: null,
                    flag: true,
                },
            },
        };
    }
}
