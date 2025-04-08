struct Level3 {
    z: Int?;
}

struct Level2 {
    l3: Level3;
    s: String;
}

struct Level1 {
    l2: Level2;
    b: Bool;
}

contract MultiNest {
    store: Level1;

    init() {
        self.store = Level1{
            l2: Level2{
                l3: Level3{z: 42},
                s: "hello",
            },
            b: true,
        };
    }
}