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

struct Layer0 {
    v0: Int;
    l1: Layer1;
}

contract NestedFourLevels {
    payload: Layer0;

    init() {
        self.payload = Layer0 {
            v0: 1,
            l1: Layer1 {
                v1: 2,
                l2: Layer2 {
                    v2: 3,
                    l3: Layer3 {
                        v3: 4
                    }
                }
            }
        };
    }
}
