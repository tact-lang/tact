struct LayerB {
    v2: Int;
}

struct LayerA {
    v1: Int;
    b: LayerB;
}

contract LayeredFields {
    composite: LayerA;

    init() {
        self.composite = LayerA {
            v1: 12,
            b: LayerB {
                v2: 34
            }
        };
    }
}
