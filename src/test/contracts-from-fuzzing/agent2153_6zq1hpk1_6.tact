struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l3: Level3;
    optStr: String?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract MultiNested {
    l1: Level1;

    init() {
        self.l1 = Level1{
            l2: Level2{
                l3: Level3{ a: 1, b: false },
                optStr: null
            },
            flag: true
        };
    }
}
