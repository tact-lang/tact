struct Layer3 {
    v3: Int;
}

struct Layer2 {
    v2: Int;
    l3: Layer3;
}

struct Layer1 {
    v1: Int;
    l2: Layer2;
}

contract TestContract {
    nestedOpt: Layer1?;

    init() {
        self.nestedOpt = Layer1 {
            v1: 1,
            l2: Layer2 {
                v2: 2,
                l3: Layer3 { v3: 3 }
            }
        };
    }
}