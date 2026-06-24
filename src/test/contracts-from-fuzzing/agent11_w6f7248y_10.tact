struct L1 {
    a: Int;
    b: Int;
}

struct L2 {
    l1a: L1;
    l1b: L1;
}

struct L3 {
    l2: L2;
}

struct L4 {
    l3: L3;
}

contract TestContract {
    storage: L4;

    init() {
        self.storage = L4{ l3: L3{ l2: L2{ l1a: L1{ a:1, b:2 }, l1b: L1{ a:3, b:4 } } } };
    }
}