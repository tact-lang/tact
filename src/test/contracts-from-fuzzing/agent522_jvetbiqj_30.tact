struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    d: Int;
}

contract LongNested {
    data: RecA;

    init() {
        self.data = RecA{
            b: RecB{
                c: RecC{
                    d: 123
                }
            }
        };
    }
}