struct L1 {
    f1: Int;
    l2: L2;
}

struct L2 {
    f2: Int;
    l3: L3;
}

struct L3 {
    f3: Int;
    l4: L4;
}

struct L4 {
    f4: Int;
    l5: L5;
}

struct L5 {
    f5: Int;
    done: Bool;
}

contract FiveLevelNested {
    root: L1;

    init() {
        self.root = L1{
            f1: 1,
            l2: L2{
                f2: 2,
                l3: L3{
                    f3: 3,
                    l4: L4{
                        f4: 4,
                        l5: L5{ f5: 5, done: true }
                    }
                }
            }
        };
    }
}
