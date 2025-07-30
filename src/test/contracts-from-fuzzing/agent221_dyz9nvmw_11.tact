struct InnerA {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
}

struct InnerB {
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
}

struct Both {
    a: InnerA;
    b: InnerB;
}

contract TwoPacked {
    state: Both;

    init() {
        self.state = Both{
            a: InnerA{
                f1: 1, f2: 2, f3: 3, f4: 4, f5: 5
            },
            b: InnerB{
                f6: 6, f7: 7, f8: 8, f9: 9, f10: 10
            }
        };
    }
}
