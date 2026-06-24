struct L4 {
    v: Int;
}

struct L3 {
    l4: L4;
}

struct L2 {
    l3: L3;
}

struct L1 {
    l2: L2;
}

contract DeepNest {
    data: L1;

    init() {
        self.data = L1{
            l2: L2{ l3: L3{ l4: L4{ v:42 } } }
        };
    }

    receive() {
        self.data = L1{
            l2: L2{ l3: L3{ l4: L4{ v:43 } } }
        };
    }
}