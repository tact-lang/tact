struct Level3 {
    value: Int;
    comment: String;
}

struct Level2 {
    optInner: Level3?;
    text: String;
}

struct Level1 {
    nested: Level2?;
    flag: Bool;
}

contract OptionalDeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                optInner: Level3{
                    value: 123,
                    comment: "deep"
                },
                text: "hi"
            },
            flag: false
        };
    }
}