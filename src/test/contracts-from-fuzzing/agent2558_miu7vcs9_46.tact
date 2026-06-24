struct L1 {
    a: Int;
}

struct L2 {
    b: Bool;
    l1: L1;
}

struct L3 {
    c: String;
    l2: L2;
}

contract NestMix {
    x: L3;

    init() {
        self.x = L3{
            c: "text",
            l2: L2{
                b: true,
                l1: L1{ a: 5 }
            }
        };
    }
}