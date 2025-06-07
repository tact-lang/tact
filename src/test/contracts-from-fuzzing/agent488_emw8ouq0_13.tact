struct Level3 {
    x: Int;
    y: Int?;
}

struct Level2 {
    nested: Level3;
    other: Int?;
}

struct Level1 {
    nested: Level2;
    more: Bool;
}

contract DeepMultilevelNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{
                    x: 777,
                    y: null
                },
                other: null
            },
            more: true
        };
    }
}