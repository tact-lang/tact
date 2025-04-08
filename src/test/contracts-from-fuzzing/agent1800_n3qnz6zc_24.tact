struct L0 {
    v: Int;
}

struct L1 {
    a: L0;
    b: L0;
}

struct L2 {
    x: L1;
    y: L1;
}

contract BiggerNesting {
    storage: L2;

    init() {
        self.storage = L2{
            x: L1{
                a: L0{ v: 1 },
                b: L0{ v: 2 }
            },
            y: L1{
                a: L0{ v: 3 },
                b: L0{ v: 4 }
            }
        };
    }
}