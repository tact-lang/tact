struct Leaf1 {
    a: Int;
}

struct Leaf2 {
    b: Bool;
}

struct Branch1 {
    l1: Leaf1;
    l2: Leaf2;
}

struct Branch2 {
    l1: Leaf1;
    flag: Bool;
}

struct Root {
    b1: Branch1;
    b2: Branch2;
    optB2: Branch2?;
}

contract MultiTree {
    root: Root;

    init() {
        self.root = Root{
            b1: Branch1{
                l1: Leaf1{ a: 1 },
                l2: Leaf2{ b: true },
            },
            b2: Branch2{
                l1: Leaf1{ a: 2 },
                flag: false,
            },
            optB2: null,
        };
    }

    receive() {
        self.root = Root{
            b1: Branch1{
                l1: Leaf1{ a: 11 },
                l2: Leaf2{ b: false },
            },
            b2: Branch2{
                l1: Leaf1{ a: 22 },
                flag: true,
            },
            optB2: null,
        };
    }
}