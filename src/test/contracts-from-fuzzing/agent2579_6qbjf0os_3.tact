struct Level1 {
    a: Int?;
}

struct Level2 {
    l1: Level1;
    b: Bool;
}

struct Level3 {
    l2: Level2;
    c: String;
}

contract DeepNestTest {
    data: Level3;
    init() {
        self.data = Level3{
            l2: Level2{
                l1: Level1{a: null},
                b: false,
            },
            c: "deep",
        };
    }
}