struct Level3 {
    f1: Int;
    f2: String;
}

struct Level2 {
    nested: Level3;
    f3: Bool;
}

struct Level1 {
    nested: Level2;
    s: String;
}

contract DeepEmbedded {
    myData: Level1;

    init() {
        self.myData = Level1{
            nested: Level2{
                nested: Level3{
                    f1: 3,
                    f2: "deep",
                },
                f3: true,
            },
            s: "hello",
        };
    }
}