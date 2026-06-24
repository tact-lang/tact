struct Level3 {
    q: Int;
}

struct Level2 {
    p: Bool?;
    l3: Level3;
}

struct Level1 {
    l2: Level2;
    s: String;
}

contract DeepNest {
    x: Level1;

    init() {
        self.x = Level1{
            l2: Level2{
                p: null,
                l3: Level3{ q: 42 },
            },
            s: "deep",
        };
    }
}