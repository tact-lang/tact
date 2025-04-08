struct LayerA { x: Int; y: Int; }
struct LayerB { m: LayerA; a: Bool; }
struct LayerC { inner: LayerB; b: Int?; }

contract NestedOptionalCombo {
    z: LayerC;

    init() {
        self.z = LayerC{ inner: LayerB{ m: LayerA{x:7,y:8}, a:true }, b: null };
    }
}