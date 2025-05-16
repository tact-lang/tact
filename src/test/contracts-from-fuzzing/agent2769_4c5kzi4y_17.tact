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
    done: Bool;
}

contract RecNest {
    payload: RecA;

    init() {
        self.payload = RecA{
            b: RecB{
                c: RecC{
                    d: RecD{
                        done: true,
                    }
                }
            }
        };
    }
}