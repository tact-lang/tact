struct Deep {
    a: Int;
    b: Level1;
}

struct Level1 {
    c: Level2;
}

struct Level2 {
    d: Level3;
}

struct Level3 {
    e: Int;
    f: Int;
}

contract DeepFields {
    storage: Deep;

    init() {
        self.storage = Deep{
            a: 1,
            b: Level1{
                c: Level2{
                    d: Level3{ e: 2, f: 3 }
                }
            }
        };
    }
}