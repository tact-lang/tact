struct FixedLayer {
    a: Int = 1;
    b: String = "s";
    c: Bool = true;
}

struct MiddleLayer {
    f1: FixedLayer;
    f2: FixedLayer;
}

contract MultiMiddleLayers {
    d: MiddleLayer;

    init() {
        self.d = MiddleLayer{
            f1: FixedLayer{},
            f2: FixedLayer{},
        };
    }
}
