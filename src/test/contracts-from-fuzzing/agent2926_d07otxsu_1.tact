struct DeepNested {
    a: Int;
    b: Bool;
    c: LevelTwo;
}

struct LevelTwo {
    d: Int?;
    e: LevelThree;
}

struct LevelThree {
    f: Bool?;
    g: Int;
}

contract NestedTest {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            a: 1,
            b: true,
            c: LevelTwo{
                d: null,
                e: LevelThree{
                    f: false,
                    g: 3
                }
            }
        };
    }
}