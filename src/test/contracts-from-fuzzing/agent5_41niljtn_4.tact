struct Level3 {
    deep: Int?;
    label: String;
}

struct Level2 {
    level3: Level3?;
    active: Bool;
}

struct Level1 {
    level2: Level2;
    note: String?;
}

contract DeepOptionals {
    nested: Level1;

    init() {
        self.nested = Level1{
            level2: Level2{
                level3: Level3{deep: null, label: "hi"},
                active: true
            },
            note: null
        };
    }
}