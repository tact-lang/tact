struct Layer3 {
    v: Int;
}

struct Layer2 {
    l3a: Layer3;
    l3b: Layer3;
}

struct Layer1 {
    l2a: Layer2;
    l2b: Layer2;
}

contract MultiNest {
    root: Layer1;

    init() {
        self.root = Layer1{
            l2a: Layer2{
                l3a: Layer3{ v: 1 },
                l3b: Layer3{ v: 2 }
            },
            l2b: Layer2{
                l3a: Layer3{ v: 3 },
                l3b: Layer3{ v: 4 }
            }
        };
    }
}