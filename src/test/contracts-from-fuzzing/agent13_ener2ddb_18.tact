struct Level3 {
    k: Int;
}

struct Level2 {
    l3: Level3;
    txt: String;
}

struct Level1 {
    l2: Level2;
    optL2: Level2?;
}

contract Hierarchical {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{ l3: Level3{ k: 7 }, txt: "deep" },
            optL2: null
        };
    }
}