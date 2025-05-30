struct Level1 {
    x: Int;
    y: Level2;
}

struct Level2 {
    z: Level3;
}

struct Level3 {
    a: Int?;
    b: Level4;
}

struct Level4 {
    flag: Bool;
    s: String?;
}

contract DeepPersist {
    state: Level1;
    init() {
        self.state = Level1{
            x: 123,
            y: Level2{
                z: Level3{
                    a: null,
                    b: Level4{
                        flag: true,
                        s: null,
                    },
                },
            },
        };
    }
}