struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    x: Level3;
    y: Int?;
}

struct Level1 {
    q: Level2?;
    z: Bool;
}

contract OptionalNested {
    data: Level1;

    init() {
        self.data = Level1{
            q: Level2{
                x: Level3{
                    a: 10,
                    b: null,
                },
                y: null,
            },
            z: true,
        };
    }
}