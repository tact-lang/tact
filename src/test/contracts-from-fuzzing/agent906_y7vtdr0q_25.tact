struct C1 {
    a: Int;
}

struct C2 {
    b: Int;
    c: C1;
}

struct C3 {
    d: Int;
    e: C2;
}

contract DeepChain {
    data: C3;

    init() {
        self.data = C3 {
            d: 1,
            e: C2 {
                b: 2,
                c: C1 {
                    a: 3,
                },
            },
        };
    }
}