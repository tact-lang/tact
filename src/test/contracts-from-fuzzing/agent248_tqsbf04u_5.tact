struct Level3 {
    v1: Int;
    v2: Bool?;
    v3: String;
}

struct Level2 {
    l3: Level3;
    note: String?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract DeepNesting {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{v1: 42, v2: null, v3: "test"},
                note: "mid"
            },
            flag: true
        };
    }
}