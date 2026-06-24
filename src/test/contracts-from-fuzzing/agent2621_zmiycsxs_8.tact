struct Level3 {
    p: Int;
    q: Bool?;
}

struct Level2 {
    l3: Level3;
    message: String?;
}

struct Level1 {
    l2: Level2;
    note: String;
}

contract Test {
    field: Level1;
    init() {
        self.field = Level1{
            l2: Level2{
                l3: Level3{p: 1, q: null},
                message: "abc"
            },
            note: "xyz"
        };
    }
}