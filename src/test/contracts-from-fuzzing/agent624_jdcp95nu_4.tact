struct Level3 {
    p: Int;
    q: Int?;
}

struct Level2 {
    x: Level3;
    y: Int;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
    label: String;
}

contract DeepNested {
    value: Level1;

    init() {
        self.value = Level1{
            nested: Level2{
                x: Level3{
                    p: 100,
                    q: null,
                },
                y: 200,
            },
            flag: true,
            label: "deep",
        };
    }
}
