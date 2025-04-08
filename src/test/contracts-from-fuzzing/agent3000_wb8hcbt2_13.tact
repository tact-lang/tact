struct Chain3 {
    a: Int;
    next: Chain4;
}

struct Chain4 {
    b: Int;
    next: Chain5;
}

struct Chain5 {
    c: Int;
    next: Chain6;
}

struct Chain6 {
    d: Int;
}

contract Test13 {
    ch: Chain3;

    init() {
        self.ch = Chain3{
            a: 1,
            next: Chain4{
                b:2,
                next: Chain5{
                    c:3,
                    next: Chain6{
                        d:4,
                    },
                },
            },
        };
    }
}
