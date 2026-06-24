struct Rec1 {
    x: Int;
}

struct Rec2 {
    r1: Rec1;
    y: Int;
}

struct Rec3 {
    r2: Rec2;
    z: Int;
}

contract Test {
    rec: Rec3;

    init() {
        self.rec = Rec3 {
            r2: Rec2 {
                r1: Rec1 { x: 1 },
                y: 2
            },
            z: 3
        };
    }

    receive() {
        self.rec = Rec3 {
            r2: Rec2 {
                r1: Rec1 { x: 10 },
                y: 20
            },
            z: 30
        };
    }
}