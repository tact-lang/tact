struct L1 {
    a: Int;
    b: String;
}

struct L2 {
    c: L1;
    d: Int;
}

contract LongNest {
    f1: L2;
    f2: L2;

    init() {
        self.f1 = L2{c: L1{a:1,b:"x"}, d:2};
        self.f2 = L2{c: L1{a:3,b:"y"}, d:4};
    }
}
