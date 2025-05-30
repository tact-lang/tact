struct Level3 {
    v: Int;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    name: String;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1 {
            l2: Level2 {
                l3: Level3 { v: 999 },
                flag: true,
            },
            name: "deep",
        };
    }
}