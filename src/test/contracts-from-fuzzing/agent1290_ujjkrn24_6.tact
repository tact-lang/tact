struct Level3 {
    val: Int;
    flag: Bool?;
}

struct Level2 {
    sub: Level3;
    text: String;
}

struct Level1 {
    sub: Level2?;
    count: Int;
}

contract DeepNested {
    root: Level1;

    init() {
        self.root = Level1{
            sub: Level2{
                sub: Level3{
                    val: 99,
                    flag: null
                },
                text: "deep"
            },
            count: 123
        };
    }
}