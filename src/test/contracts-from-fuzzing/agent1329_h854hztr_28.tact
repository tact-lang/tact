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

struct LayerF {
    f: LayerE;
}

contract DeepLayers {
    data: LayerF;

    init() {
        self.data = LayerF{ f: LayerE{ e: LayerD{ d: LayerC{ c: LayerB{ b: LayerA{ a:1 } } } } } };
    }
}
