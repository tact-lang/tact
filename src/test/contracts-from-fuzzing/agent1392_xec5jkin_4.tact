struct Level3 { v: Int; }

struct Level2 {
    z: String;
    inner: Level3;
}

struct Level1 {
    flag: Bool;
    middle: Level2;
}

contract DeepNest {
    store: Level1;

    init() {
        self.store = Level1 {
            flag: false,
            middle: Level2 {
                z: "deep",
                inner: Level3 { v: 777 }
            }
        };
    }
}