struct NS1 {
    v1: Int;
}

struct NS2 {
    v2: Int;
    nest1: NS1;
}

struct NS3 {
    nest2: NS2;
    opti: Int?;
}

contract Chain {
    c: NS3;

    init() {
        self.c = NS3{
            nest2: NS2{
                v2: 1,
                nest1: NS1{ v1: 2 }
            },
            opti: null
        };
    }
}