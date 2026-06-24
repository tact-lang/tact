struct LayerA {
    a: Int;
}
struct LayerB {
    b: Bool;
}

struct LayerC {
    la: LayerA;
    lb: LayerB;
}

contract ParallelNesting {
    root: LayerC;

    init() {
        self.root = LayerC{
            la: LayerA{a:1},
            lb: LayerB{b:false}
        };
    }
}