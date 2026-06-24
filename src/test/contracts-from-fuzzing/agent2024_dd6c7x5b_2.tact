struct Level3 {
    x: Int;
}

struct Level2 {
    y: Level3;
    z: Int;
}

struct Level1 {
    p: Level2;
    q: Bool;
}

contract DeeplyNested {
    data: Level1;

    init() {
        self.data = Level1{
            p: Level2{
                y: Level3{
                    x: 42
                },
                z: 10
            },
            q: true
        };
    }
}