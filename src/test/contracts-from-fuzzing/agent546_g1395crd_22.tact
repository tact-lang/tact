struct RecA {
    a: Int;
    optB: RecB?;
}

struct RecB {
    b: Int;
    optC: RecC?;
}

struct RecC {
    c: Int;
    optD: RecD?;
}

struct RecD {
    d: Int;
}

contract RecursiveOptionals {
    rec: RecA;

    init() {
        self.rec = RecA{
            a: 1,
            optB: RecB{
                b: 2,
                optC: RecC{
                    c:3,
                    optD: RecD{d:4}
                }
            }
        };
    }
}
