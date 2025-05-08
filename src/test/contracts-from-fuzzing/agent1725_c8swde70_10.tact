struct Level3 {
    s: String;
    b: Bool;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract NestedWide {
    data: Level1;

    init() {
        self.data = Level1{
            l2a: Level2{
                l3a: Level3{ s: "a", b: true },
                l3b: Level3{ s: "b", b: false }
            },
            l2b: Level2{
                l3a: Level3{ s: "c", b: false },
                l3b: Level3{ s: "d", b: true }
            }
        };
    }
}