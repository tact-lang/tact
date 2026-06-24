struct DeepNested {
    a: Int;
    b: LevelOne;
}

struct LevelOne {
    c: Int;
    d: LevelTwo;
}

struct LevelTwo {
    e: Bool;
    f: LevelThree;
}

struct LevelThree {
    g: Int;
    h: Bool;
}

contract TestDeepStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 10,
            b: LevelOne{
                c: 20,
                d: LevelTwo{
                    e: true,
                    f: LevelThree{
                        g: 30,
                        h: false
                    }
                }
            }
        };
    }
}
