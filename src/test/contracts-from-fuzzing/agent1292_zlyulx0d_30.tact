struct LayerA {
    a: Int;
}

struct LayerB {
    b: LayerA;
}

struct LayerC {
    c: LayerB;
}

struct LayerD {
    d: LayerC;
}

struct LayerE {
    e: LayerD;
}

contract NestedLayers {
    val: LayerE;
    init() {
        self.val = LayerE{
            e: LayerD{
                d: LayerC{
                    c: LayerB{
                        b: LayerA{
                            a: 7
                        }
                    }
                }
            }
        };
    }
}