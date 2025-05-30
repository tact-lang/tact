struct Level3 {
    n: Int;
    s: String?;
}

struct Level2 {
    a: Bool;
    inner: Level3;
}

struct Level1 {
    x: Int;
    y: Level2?;
}

contract DeepOptionals {
    data: Level1;

    init() {
        self.data = Level1{
            x: 10,
            y: Level2{
                a: false,
                inner: Level3{
                    n: 99,
                    s: null,
                },
            },
        };
    }
}
