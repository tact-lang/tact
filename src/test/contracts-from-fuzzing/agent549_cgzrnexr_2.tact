struct DeepNested {
    aa: Int;
    bb: Bool;
    cc: Int?;
}

struct MidNested {
    inner1: DeepNested;
    inner2: DeepNested;
    flag: Bool;
}

struct Outer {
    mid: MidNested;
    optional: MidNested?;
    flag2: Bool;
}

contract Test {
    bigField: Outer;

    init() {
        self.bigField = Outer{
            mid: MidNested{
                inner1: DeepNested{ aa: 1, bb: false, cc: null },
                inner2: DeepNested{ aa: 2, bb: true, cc: null },
                flag: true,
            },
            optional: null,
            flag2: false,
        };
    }

    receive() {
        self.bigField = Outer{
            mid: MidNested{
                inner1: DeepNested{ aa: 3, bb: true, cc: 100 },
                inner2: DeepNested{ aa: 4, bb: false, cc: 55 },
                flag: false,
            },
            optional: null,
            flag2: true,
        };
    }
}