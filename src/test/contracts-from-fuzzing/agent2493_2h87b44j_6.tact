struct Level3 { a: Int; b: String; }

struct Level2 {
    l3a: Level3;
    l3b: Level3?;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2?;
}

contract TestContract {
    nestedOpt: Level1;

    init() {
        self.nestedOpt = Level1{
            l2a: Level2{
                l3a: Level3{ a: 1, b: "x" },
                l3b: null
            },
            l2b: null
        };
    }
}