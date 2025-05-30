struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    foo: Int;
}

contract LongChain {
    data: RecA;

    init() {
        self.data = RecA {
            b: RecB {
                c: RecC {
                    foo: 42
                }
            }
        };
    }
}
