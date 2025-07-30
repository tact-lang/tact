struct Level3A {
    a: Int;
}

struct Level3B {
    b: Bool;
}

struct Level2 {
    l3a: Level3A;
    l3b: Level3B;
}

struct Level1 {
    l2: Level2;
    val: String;
}

contract DeepBreadthStruct {
    storage: Level1;

    init() {
        self.storage = Level1{
            l2: Level2{
                l3a: Level3A{ a: 7 },
                l3b: Level3B{ b: false }
            },
            val: "deep"
        };
    }
}