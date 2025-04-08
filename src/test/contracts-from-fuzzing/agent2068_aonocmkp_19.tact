struct P1 {
    x: Int;
}

struct P2 {
    p1: P1;
    optP1: P1?;
}

struct P3 {
    p2: P2;
    optP2: P2?;
}

struct P4 {
    p3: P3;
    optP3: P3?;
}

contract MultiOptionals {
    body: P4;

    init() {
        self.body = P4 {
            p3: P3{
                p2: P2{p1: P1{x:1}, optP1:null},
                optP2: null
            },
            optP3: null
        };
    }
}