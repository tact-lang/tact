struct LayerA {
    b: LayerB;
}

struct LayerB {
    c: LayerC;
}

struct LayerC {
    d: LayerD;
}

struct LayerD {
    e: LayerE;
}

struct LayerE {
    x: Int;
}

contract DeepChain {
    var: LayerA;

    init() {
        self.var = LayerA{
            b: LayerB{
                c: LayerC{
                    d: LayerD{
                        e: LayerE{
                            x: 999
                        }
                    }
                }
            }
        };
    }
}