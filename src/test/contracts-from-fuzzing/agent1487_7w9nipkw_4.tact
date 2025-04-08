struct L1 {
    a: Int;
    b: Int;
}

struct L2 {
    l1: L1;
    c: Int;
}

struct L3 {
    l2: L2;
    d: Int;
}

struct L4 {
    l3: L3;
    e: Int;
}

contract DeepNestedStorage {
    data: L4;

    init() {
        self.data = L4{
            l3: L3{
                l2: L2{
                    l1: L1{ a: 1, b: 2 },
                    c: 3
                },
                d: 4
            },
            e: 5
        };
    }
}