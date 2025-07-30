struct Level3 {
    z: Bool;
}

struct Level2 {
    y: Int?;
    deep: Level3;
}

struct Level1 {
    x: String;
    mid: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1 {
            x: "hi",
            mid: Level2 {
                y: null,
                deep: Level3 {
                    z: true
                }
            }
        };
    }
}
