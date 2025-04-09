struct Level3 {
    f: Int;
}

struct Level2 {
    e: Level3;
}

struct Level1 {
    d: Level2;
}

struct Root {
    a: Int;
    b: Bool;
    c: Level1;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            a: 42,
            b: false,
            c: Level1{
                d: Level2{
                    e: Level3{
                        f: 77
                    }
                }
            }
        };
    }
}