struct Level2 {
    x: Int;
    y: Bool;
}

struct Level1 {
    nested: Level2;
    text: String;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                x: 1,
                y: false,
            },
            text: "deep",
        };
    }
}