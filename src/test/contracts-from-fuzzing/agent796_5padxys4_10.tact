struct RecA {
    val: Int;
}

struct RecB {
    rec: RecA;
}

struct RecC {
    rec: RecB;
}

struct RecD {
    rec: RecC;
}

contract Test {
    storage: RecD;
    init() {
        self.storage = RecD{
            rec: RecC{
                rec: RecB{
                    rec: RecA{ val: 42 }
                }
            }
        };
    }
}