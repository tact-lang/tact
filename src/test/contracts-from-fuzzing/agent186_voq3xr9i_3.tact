struct Level3 {
    z: Int?;
    name: String;
}

struct Level2 {
    inner: Level3;
    description: String;
}

struct Level1 {
    nested: Level2;
    active: Bool;
}

contract DeepNesting {
    state: Level1;

    init() {
        self.state = Level1{
            nested: Level2 {
                inner: Level3 { z: null, name: "deep" },
                description: "desc"
            },
            active: true
        };
    }
}