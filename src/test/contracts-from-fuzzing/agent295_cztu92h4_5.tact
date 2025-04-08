struct DeepNested {
    a: Int;
    b: Bool;
    c: MidLevel;
}

struct MidLevel {
    x: Int;
    y: LowLevel;
}

struct LowLevel {
    p: Bool;
    q: InnerMost;
}

struct InnerMost {
    z: Int?;
    flag: Bool;
}

contract VeryDeepNestedTest {
    info: DeepNested = DeepNested{
        a: 1,
        b: true,
        c: MidLevel {
            x: 2,
            y: LowLevel {
                p: false,
                q: InnerMost {
                    z: null,
                    flag: true,
                },
            },
        },
    };

    init() {
        self.info = self.info;
    }

    receive() {
        self.info = self.info;
    }
}