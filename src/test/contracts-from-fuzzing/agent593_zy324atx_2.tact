struct Level3 {
    z: Int = 3;
}

struct Level2 {
    y: Int = 2;
    s3: Level3 = Level3{};
}

struct Level1 {
    x: Int = 1;
    s2: Level2 = Level2{};
}

contract DeepNested {
    store: Level1 = Level1{};
    init() {
        self.store = Level1{
            x: 10,
            s2: Level2{
                y: 20,
                s3: Level3{ z: 30 },
            },
        };
    }
}