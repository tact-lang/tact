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

contract TestContract {
    x: RecA;

    init() {
        self.x = RecA{
            b: RecB{
                c: RecC{
                    d: RecD{ val: 99 }
                }
            }
        };
    }
}