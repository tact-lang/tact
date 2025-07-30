struct StressNested1 {
    a: StressNested2;
}

struct StressNested2 {
    b: StressNested3;
}

struct StressNested3 {
    c: StressNested4;
}

struct StressNested4 {
    d: StressNested5;
}

struct StressNested5 {
    e: StressNested6;
}

struct StressNested6 {
    f: Int;
}

contract VeryDeepNestedStruct {
    root: StressNested1;

    init() {
        self.root = StressNested1{
            a: StressNested2{
                b: StressNested3{
                    c: StressNested4{
                        d: StressNested5{
                            e: StressNested6{
                                f: 123456,
                            },
                        },
                    },
                },
            },
        };
    }
}