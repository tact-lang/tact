struct Small {
    i: Int;
}

struct Large {
    a: Small;
    b: Small;
    c: Small;
    d: Small;
    e: Small;
}

contract Test {
    many: Large;

    init() {
        self.many = Large{
            a: Small{ i: 1 },
            b: Small{ i: 2 },
            c: Small{ i: 3 },
            d: Small{ i: 4 },
            e: Small{ i: 5 }
        };
    }
}