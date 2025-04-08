struct Inner {
    flag: Bool = false;
}

struct Layer {
    name: String = "layer";
    layerNum: Int = 1;
    next: Inner;
}

struct Wrapper {
    start: Int = 0;
    w: Layer;
}

contract ComplexNestOptional {
    w: Wrapper;
    optLayer: Layer?;

    init() {
        self.w = Wrapper{
            start: 0,
            w: Layer { name: "layer", layerNum: 1, next: Inner{} }
        };
        self.optLayer = null;
    }
}
