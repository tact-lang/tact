struct Level3 {
    s: String;
    b: Bool;
    x: Int;
}

struct Level2 {
    l3_a: Level3;
    l3_b: Level3;
}

struct Level1 {
    l2_a: Level2;
    l2_b: Level2;
    num: Int;
}

contract WideDeepStorage {
    data: Level1;

    init() {
        self.data = Level1{
            l2_a: Level2{
                l3_a: Level3{ s: "a", b: true, x: 1 },
                l3_b: Level3{ s: "b", b: false, x: 2 }
            },
            l2_b: Level2{
                l3_a: Level3{ s: "c", b: false, x: 3 },
                l3_b: Level3{ s: "d", b: true, x: 4 }
            },
            num: 42
        };
    }
}