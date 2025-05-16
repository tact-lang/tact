struct Level3 {
    id: Int?;
    valid: Bool;
}

struct Level2 {
    nested: Level3;
    label: String;
}

struct Level1 {
    inner: Level2;
    count: Int;
}

contract DeepNested {
    field: Level1;

    init() {
        self.field = Level1{
            inner: Level2{
                nested: Level3{
                    id: null,
                    valid: false,
                },
                label: "deep",
            },
            count: 100,
        };
    }
}