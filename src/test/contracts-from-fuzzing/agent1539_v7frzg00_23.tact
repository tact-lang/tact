struct DeepOpt {
    d1: Int?;
    d2: InnerOpt1?;
}

struct InnerOpt1 {
    z: Int?;
    o: InnerOpt2?;
}

struct InnerOpt2 {
    k: Int?;
}

contract OptionalLayers {
    dd: DeepOpt?;
    init() {
        self.dd = null;
    }
}