struct L3 {
    q: Int;
}

struct L2 {
    l3: L3;
    value: Int;
}

struct L1 {
    a: Int;
    l2: L2;
}

contract DeepNest {
    deep: L1;

    init() {
        self.deep = L1{
            a: 1,
            l2: L2{
                l3: L3{ q: 3 },
                value: 2,
            },
        };
    }
}
