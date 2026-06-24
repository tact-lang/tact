struct L3 {
    a: Int;
    b: Bool;
}

struct L2 {
    l3a: L3;
    l3b: L3;
}

struct L1 {
    l2a: L2;
    l2b: L2;
}

contract DeeplyNested {
    value: L1;

    init() {
        self.value = L1{
            l2a: L2{
                l3a: L3{a: 1, b: true},
                l3b: L3{a: 2, b: false},
            },
            l2b: L2{
                l3a: L3{a: 3, b: true},
                l3b: L3{a: 4, b: false},
            },
        };
    }
}
