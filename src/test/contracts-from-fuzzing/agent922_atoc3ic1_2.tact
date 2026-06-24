struct DeepNested {
    a: Bool;
    b: Level2;
}

struct Level2 {
    c: Level3;
    d: Bool;
}

struct Level3 {
    e: Int;
    f: Level4;
}

struct Level4 {
    g: Bool?;
    h: Int;
}

contract TestContract {
    store: DeepNested;
    flag: Bool;

    init() {
        self.store = DeepNested{
            a: true,
            b: Level2 {
                c: Level3 {
                    e: 123,
                    f: Level4 {
                        g: null,
                        h: 456
                    }
                },
                d: false
            }
        };
        self.flag = false;
    }
}