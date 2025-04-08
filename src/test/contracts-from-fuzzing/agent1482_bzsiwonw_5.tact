struct L1 {
    x1: Int;
    x2: Bool;
    x3: String?;
}

struct L2 {
    s1: L1;
    s2: L1;
}

struct L3 {
    l2a: L2;
    l2b: L2;
}

contract TestContract {
    deep: L3;

    init() {
        self.deep = L3{
            l2a: L2{
                s1: L1{ x1: 1, x2: true, x3: null },
                s2: L1{ x1: 2, x2: false, x3: null },
            },
            l2b: L2{
                s1: L1{ x1: 3, x2: true, x3: null },
                s2: L1{ x1: 4, x2: false, x3: null },
            }
        };
    }
}