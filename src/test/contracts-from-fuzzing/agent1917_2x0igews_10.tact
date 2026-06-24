struct L1 {
    v1: Int;
    v2: Bool;
}

struct L2 {
    f1: L1;
    f2: L1;
}

struct L3 {
    l2field: L2;
    num: Int;
}

struct L4 {
    deep: L3;
    flag: Bool;
}

contract MultiNest {
    param: L4;

    init() {
        self.param = L4{
            deep: L3{
                l2field: L2{
                    f1: L1{v1: 1, v2: true},
                    f2: L1{v1: 2, v2: false}
                },
                num: 42
            },
            flag: true
        };
    }
}
