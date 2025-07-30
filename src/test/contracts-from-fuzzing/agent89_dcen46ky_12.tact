struct L1 { v1: Int; }
struct L2 { v2: Int; }
struct L3 { v3: Int; }
struct L4 { v4: Int; }
struct L5 { v5: Int; }

struct Combo {
    a: L1;
    b: L2;
    c: L3;
    d: L4;
    e: L5;
}

contract Fuzz12 {
    complex: Combo;

    init() {
        self.complex = Combo{
            a: L1{ v1:1 },
            b: L2{ v2:2 },
            c: L3{ v3:3 },
            d: L4{ v4:4 },
            e: L5{ v5:5 },
        };
    }
}