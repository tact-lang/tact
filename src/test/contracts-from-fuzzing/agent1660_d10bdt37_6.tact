struct RecA {
    x: Int;
    b: RecB;
}

struct RecB {
    y: Int;
    c: RecC;
}

struct RecC {
    z: Int;
}

contract Test6 {
    rec: RecA;
    init() {
        self.rec = RecA {
            x:1,
            b: RecB {
                y:2,
                c: RecC { z:3 }
            }
        };
    }
}