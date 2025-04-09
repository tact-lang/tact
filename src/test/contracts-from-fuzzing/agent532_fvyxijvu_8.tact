struct LayerB {
    d: Int;
    e: String?;
}

struct LayerA {
    b: Int;
    c: LayerB;
}

contract TwoLayerOptional {
    f: LayerA;

    init() {
        self.f = LayerA{
            b: 3,
            c: LayerB{ d: 5, e: null }
        };
    }
}