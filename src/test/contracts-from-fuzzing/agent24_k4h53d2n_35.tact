struct RecA {
    recB: RecB;
}

struct RecB {
    recC: RecC;
}

struct RecC {
    val1: Int;
    val2: Int;
}

contract MultiRecStruct {
    data: RecA;

    init() {
        self.data = RecA{
            recB: RecB {
                recC: RecC {
                    val1: 101,
                    val2: 202
                }
            }
        };
    }
}