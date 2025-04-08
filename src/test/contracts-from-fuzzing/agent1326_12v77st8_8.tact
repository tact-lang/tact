struct L1 {
    a: Int;
}

struct L2 {
    x: L1;
    y: L1;
}

struct L3 {
    z: L2;
}

struct L4 {
    p: L3;
}

contract DupNestedStructs {
    data: L4;
    init() {
        self.data = L4{
            p: L3{
                z: L2{
                    x: L1{a: 1},
                    y: L1{a: 2},
                },
            },
        };
    }
}