struct LayerC {
    z: Int;
}

struct LayerB {
    y: LayerC;
}

struct LayerA {
    x: LayerB;
}

contract WrapDeeper {
    wrap: LayerA;

    init() {
        self.wrap = LayerA{
            x: LayerB{
                y: LayerC{
                    z: 555
                }
            }
        };
    }
}