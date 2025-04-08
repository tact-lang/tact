struct Level3 {
    a: Int?;
    b: Bool;
}

struct Level2 {
    l3: Level3;
    s: String?;
}

struct Level1 {
    l2: Level2;
    num: Int;
}

contract TestNested {
    data: Level1 = Level1{
        l2: Level2{
            l3: Level3{
                a: null,
                b: true
            },
            s: null
        },
        num: 5
    };

    init() {
        self.data = self.data;
    }

    receive() {
        self.data = self.data;
    }
}