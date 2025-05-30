struct LayerA { b: LayerB; }
struct LayerB { c: LayerC; }
struct LayerC { flag: Bool?; }

contract MultiNestedOpts {
    a: LayerA;

    init() {
        self.a = LayerA{ b: LayerB{ c: LayerC{ flag: null } } };
    }
}
