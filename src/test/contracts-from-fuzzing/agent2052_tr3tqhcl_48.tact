struct LayerC {
    c: Int?;
}

struct LayerB {
    b: LayerC?;
}

struct LayerA {
    a: LayerB?;
}

contract MultiOptionalNestingPopulated {
    root: LayerA;

    init() {
        self.root = LayerA{
            a: LayerB{
                b: LayerC{
                    c: 123
                }
            }
        };
    }
}