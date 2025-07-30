struct LayerA {
    x: Int;
}
struct LayerB {
    a: LayerA;
}
struct LayerC {
    b: LayerB;
    y: Int;
}
contract Layered {
    l: LayerC;
    init() {
        self.l = LayerC{
            b: LayerB{ a: LayerA{ x: 5 } },
            y: 6
        };
    }
}