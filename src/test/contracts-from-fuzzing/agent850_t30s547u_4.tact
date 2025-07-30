struct Layer1 {
    a: Int;
}

struct Layer2 {
    l1: Layer1;
}

struct Layer3 {
    l2: Layer2;
}

contract VeryDeepNested {
    nested: Layer3;

    init() {
        self.nested = Layer3{
            l2: Layer2{
                l1: Layer1{ a: 7 },
            },
        };
    }
}