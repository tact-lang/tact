struct LayerA {
    x: Int;
    y: LayerB;
}
struct LayerB {
    z: LayerC;
}
struct LayerC {
    w: LayerD;
}
struct LayerD {
    k: String;
}
contract Layered {
    val: LayerA;
    init() {
        self.val = LayerA{
            x: 1,
            y: LayerB{
                z: LayerC{
                    w: LayerD{
                        k: "deep"
                    }
                }
            }
        };
    }
}
