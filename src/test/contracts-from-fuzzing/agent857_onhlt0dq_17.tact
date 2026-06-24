struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    txt: String;
}

contract Test {
    rec: RecA;

    init() {
        self.rec = RecA{
            b: RecB{
                c: RecC{
                    txt: "deep string"
                }
            }
        };
    }
}