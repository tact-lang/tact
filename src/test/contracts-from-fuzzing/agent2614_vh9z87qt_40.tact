struct NestedLayerA {
    val:Int;
}
struct NestedLayerB {
    x:NestedLayerA;
}
struct NestedLayerC {
    y:NestedLayerB;
}

contract TripleNestLayers {
    store:NestedLayerC;

    init() {
        self.store = NestedLayerC{
            y:NestedLayerB{
                x:NestedLayerA{val:999}
            }
        };
    }
}