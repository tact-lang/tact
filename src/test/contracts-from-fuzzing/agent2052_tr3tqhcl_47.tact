struct LayerC {
    c: Int?;
}

struct LayerB {
    b: LayerC?;
}

struct LayerA {
    a: LayerB?;
}

contract MultiOptionalNestingNull {
    root: LayerA;

    init() {
        self.root = LayerA{
            a: null
        };
    }
}