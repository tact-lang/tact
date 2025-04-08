struct LayerA { x: Int }
struct LayerB { y: LayerA }
struct LayerC { z: LayerB }

struct ComplexNesting {
    la: LayerA;
    lb: LayerB;
    lc: LayerC;
}

contract ComplexNestingContract {
    complex: ComplexNesting;

    init() {
        self.complex = ComplexNesting{
            la: LayerA{x:1},
            lb: LayerB{y:LayerA{x:2}},
            lc: LayerC{z:LayerB{y:LayerA{x:3}}}
        };
    }
}
