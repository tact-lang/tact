struct Level3 {
    x: Int;
    y: Int;
}

struct Level2 {
    nest: Level3;
    flag: Bool;
}

struct Level1 {
    sub: Level2;
    text: String;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            sub: Level2{
                nest: Level3{ x: 1, y: 2 },
                flag: true,
            },
            text: "hello",
        };
    }
}
