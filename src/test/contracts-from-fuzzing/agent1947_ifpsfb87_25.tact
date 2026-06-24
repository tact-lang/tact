struct RecB {
    a: Int;
}

struct RecA {
    b: RecB;
}

contract ChainRec {
    rec: RecA;
    init() {
        self.rec = RecA{
            b: RecB{
                a: 5,
            },
        };
    }
}