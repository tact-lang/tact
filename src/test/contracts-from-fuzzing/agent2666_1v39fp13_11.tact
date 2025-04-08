struct RecA {
    i: Int;
}
struct RecB {
    a: RecA;
}
struct RecC {
    b: RecB;
}
struct RecD {
    c: RecC;
}
struct RecE {
    d: RecD;
}
struct RecF {
    e: RecE;
}

contract DeepChain {
    chain: RecF;

    init() {
        self.chain = RecF{
            e: RecE{
                d: RecD{
                    c: RecC{
                        b: RecB{
                            a: RecA{
                                i: 99
                            }
                        }
                    }
                }
            }
        };
    }
}