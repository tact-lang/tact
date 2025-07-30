struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    value: Int;
}

contract ChainNested {
    val: RecA;

    init() {
        self.val = RecA{
            b: RecB{
                c: RecC{
                    value: 123
                }
            }
        };
    }
}