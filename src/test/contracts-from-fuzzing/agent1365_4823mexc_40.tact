struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    d: RecD;
}

struct RecD {
    val: Int;
}

contract RecursiveChain {
    f: RecA;

    init() {
        self.f = RecA{
            b: RecB{
                c: RecC{
                    d: RecD{
                        val: 42,
                    },
                },
            },
        };
    }
}