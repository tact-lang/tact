struct L2 {
    f: Int;
}

struct L1 {
    nested: L2;
}

contract ArrayStructs {
    a1: L1;
    a2: L1;
    a3: L1;
    a4: L1;

    init() {
        self.a1 = L1{nested: L2{f:1}};
        self.a2 = L1{nested: L2{f:2}};
        self.a3 = L1{nested: L2{f:3}};
        self.a4 = L1{nested: L2{f:4}};
    }
}
