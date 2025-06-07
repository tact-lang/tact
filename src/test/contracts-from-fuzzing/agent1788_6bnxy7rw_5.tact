struct Level3 {
    v: Bool?;
    w: Int;
}

struct Level2 {
    q: Level3;
    r: Int?;
}

struct Level1 {
    x: Int;
    y: Level2;
    z: Bool;
}

contract DeepHierarchy {
    data: Level1 = Level1{
        x: 1,
        y: Level2{
            q: Level3{
                v: null,
                w: 5
            },
            r: null
        },
        z: true
    };
    init() {
        self.data = Level1{
            x: 10,
            y: Level2{
                q: Level3{
                    v: false,
                    w: 100
                },
                r: 20
            },
            z: false
        };
    }
}