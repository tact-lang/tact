struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    val: Int;
}

contract DeepRec {
    rec: RecA;

    init() {
        self.rec = RecA{
            b: RecB{
                c: RecC{
                    val: 7
                }
            }
        };
    }
}